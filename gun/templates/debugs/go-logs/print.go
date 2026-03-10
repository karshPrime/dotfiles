// +build NDEBUG
// logs/print.go

package logs

//- Imports ----------------------------------------------------------------------------------------

import (
	"os"
	"fmt"
	"github.com/fatih/color"
)


//- Public Calls -----------------------------------------------------------------------------------

func ErrorPrint( aPrompt any, args ...any ) {
	lRed := color.New( color.FgRed ).SprintFunc();
	lLiRed := color.New( color.FgHiRed ).SprintFunc();

	fmt.Fprint( os.Stderr, lRed("[Error] "), lLiRed(aPrompt) )
	fmt.Fprintln( os.Stderr, args... );
}

func WarningPrint( aPrompt any, args ...any ) {
	lYellow := color.New( color.FgYellow ).SprintFunc();
	lLiYellow := color.New( color.FgHiYellow ).SprintFunc();

	fmt.Fprint( os.Stderr, lYellow("[Warning] "), lLiYellow(aPrompt) );
	fmt.Fprintln( os.Stderr, args... );
}

func DebugPrint( _ any, args ...any ) {
	return;
}

