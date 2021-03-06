/*
 *  TextManager.h
 *
 *  Created by jpecho on 11/17/10.
 *  Copyright 2010 __MyCompanyName__. All rights reserved.
 *
 */

#ifndef _TEXT_MANAGER_H_
#define _TEXT_MANAGER_H_

#include <string>
#include <map>
#include <vector>

#include "PropertyList.h"

namespace Walaber
{
	//enums
	enum Language 
	{ 
		ENGLISH_NTSC,
		ENGLISH_PAL,
		FRENCH_NTSC,
		FRENCH_PAL,
		ITALIAN,
		GERMAN,
		SPANISH_NTSC,
		CASTILIANSPANISH,
		AMERICAN,
		JAPANESE,
        KOREAN,
		CHINESE_SIMPLE,
		CHINESE_TRADITIONAL,
		RUSSIAN,
		DUTCH,
        CZECH,
        POLISH,
        PORTUGUESE_BRAZILIAN,
		UNRECOGNIZED
	};	
	
	class TextManager
	{
	public:
		//typedef
		struct SubtitleInfo
		{
			std::string		text;
			std::string		character;
		};
		
		typedef std::map< Language, std::map<std::string,std::string> >		LanguageMap;
		typedef std::map< Language, std::map<std::string, SubtitleInfo > >	SubtitleMap;
		static void clearAll();
		
		// standard in-game text
		static std::string getString(std::string name, Language l);
		static std::string getString(std::string name);
		
		static bool stringExists(std::string name, Language l);
		static bool stringExists(std::string name);
		
		// subtitle text
		static SubtitleInfo getSubtitle(std::string assetName, Language l);
		static SubtitleInfo getSubtitle(std::string assetName);
		
		static bool subtitleExists(std::string assetName, Language l);
		static bool subtitleExists(std::string assetName);
		
		
		static void setCurrentLanguage( Language l ) { mCurrentLanguage = l; }
		static Language getCurrentLanguage() { return mCurrentLanguage; }
		
		
		// append the contents of this file into the string list.
		static void loadScriptFromTSV(std::string filename, std::vector<Language>& languagesToLoad);
		static void loadedScriptFile( void* params );
		
		static void loadSubtitlesFromTSV(std::string filename, std::vector<Language>& languagesToLoad);
		static void loadedSubtitleFile( void* params );
		
		static void clearAllLanguageStrings() { mDictionary.clear(); }
		static void clearAllSubtitleStrings() { mSubtitles.clear(); }
		
		static bool stringToLanguage(std::string p, Language& lOut);
		
		static Language CountryInfoToLanguage(std::string country);
        
        static std::string getISOCodeForCurrentLanguage();
        static std::string getISOCodeForLanguage(const Language lang);
		
        static std::string getISOLanguageCountryCodeForCurrentLanguage();
        static std::string getISOLanguageCountryCodeForLanguage(const Language lang);
        
		static std::string languageToString(Language l);
		
		static void getAvailableLanguages(std::vector<Language>& lOut);
		
		static void getAvailableLanguagesAsStrings(std::vector<std::string> lOut);		
		
		static const std::map< std::string, std::string >* getLanguageMap( Language l );
		static const std::map< std::string, SubtitleInfo >* getSubtitleMap( Language l );
		
	protected:
		
		static bool containsLanguage(const std::vector<Language>& langList, const Language& lang);
		
		static LanguageMap		    mDictionary;
		static SubtitleMap			mSubtitles;
		
		static Language				mCurrentLanguage;
		
		static std::vector<Language>	mLanguagesToLoad;
	};
	
}

#endif
