// +build !NDEBUG
// logs/print.go

package logs

//- Imports ----------------------------------------------------------------------------------------

import (
	"os"
	"fmt"
	"runtime"
	"github.com/fatih/color"
)


//- Private Helpers --------------------------------------------------------------------------------

func lineInfo() string  {
	_, lFile, lLine, ok := runtime.Caller( 2 )
	if ok {
		return fmt.Sprintf( "(%s:%d) ", lFile, lLine )
	} else {
		return "(Could not retrieve caller information) "
	}
}

//- Public Calls -----------------------------------------------------------------------------------

func ErrorPrint( aPrompt any, args ...any ) {
	lRed := color.New( color.FgRed ).SprintFunc();
	lLiRed := color.New( color.FgHiRed ).SprintFunc();

	fmt.Fprint( os.Stderr, lRed("[ERROR] "), lLiRed(lineInfo()), aPrompt );
	fmt.Fprintln( os.Stderr, args... );
}

func WarningPrint( aPrompt any, args ...any ) {
	lYellow := color.New( color.FgYellow ).SprintFunc();
	lLiYellow := color.New( color.FgHiYellow ).SprintFunc();

	fmt.Fprint( os.Stderr, lYellow("[WARNING] "), lLiYellow(lineInfo()), aPrompt );
	fmt.Fprintln( os.Stderr, args... );
}

func DebugPrint( aPrompt any, args ...any ) {
	lBlue := color.New( color.FgBlue ).SprintFunc();
	lLiBlue := color.New( color.FgHiBlue ).SprintFunc();

	fmt.Fprint( os.Stderr, lBlue("[DEBUG] "), lLiBlue(lineInfo()), aPrompt );
	fmt.Fprintln( os.Stderr, args... );
}

