
// logs/help.go

package logs

//- Imports ----------------------------------------------------------------------------------------

import (
	"os"
	"fmt"
	"github.com/fatih/color"
)


//- Private Helpers --------------------------------------------------------------------------------

func helpAll() {
	lRed := color.New( color.FgHiRed ).SprintFunc();
	lBlue := color.New( color.FgHiBlue ).SprintFunc();
	// lGray := color.New( color.FgHiBlack ).SprintFunc();
	lGreen := color.New( color.FgHiGreen ).SprintFunc();
	lYellow := color.New( color.FgHiYellow ).SprintFunc();
	// lDullGreen := color.New( color.FgGreen ).SprintFunc();

	fmt.Println(
		"\nUSAGE:",
		"\n  ", lYellow("$"), lRed(""), lGreen( "[command]" ), lBlue( "[flags] [arguments]" ),
		"\n",
		"\nCOMMANDS:",



		"\n",
		"\nEXAMPLES:",



		"\n",
		"\nNOTE:",
	);
}


//- Public Calls -----------------------------------------------------------------------------------

func Help() {
	if len( os.Args ) < 2 {
		fmt.Println( "About project" );
		helpAll();

		return;
	}

	HelpCommand( os.Args[1] );
}

func HelpCommand( aCommand string ) {
	// lRed := color.New( color.FgHiRed ).SprintFunc();
	// lBlue := color.New( color.FgHiBlue ).SprintFunc();
	// lGray := color.New( color.FgHiBlack ).SprintFunc();
	// lGreen := color.New( color.FgHiGreen ).SprintFunc();
	// lYellow := color.New( color.FgHiYellow ).SprintFunc();
	// lDullGreen := color.New( color.FgGreen ).SprintFunc();
}

