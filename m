From: Matthew Harrell <mharrell-dated-1105380159.655dad@bittwiddlers.com>
Subject: Re: found unsupported CPU with Enhanced SpeedStep
Date: Wed, 5 Jan 2005 13:02:32 -0500
Message-ID: <20050105180232.GA29313@bittwiddlers.com>
References: <20041230014005.GA16358@bittwiddlers.com>
	<1104446294.24179.1.camel@localhost>
	<20050102120729.GB23300@dominikbrodowski.de>
	<20050105160622.GE19199@poupinou.org>
	<20050105162234.GA18703@bittwiddlers.com>
	<20050105172415.GH19199@poupinou.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20050105172415.GH19199@poupinou.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bruno Ducrot <ducrot@poupinou.org>
Cc: Matthew Harrell <mharrell-dated-1105374160.f5a808@bittwiddlers.com>, cpufreq list <cpufreq@www.linux.org.uk>

: There is four Load statements in the ssdt.  I need to look what tables 
: are loaded at run time.
: 
: Could you please send to me the result of the attached program
: when HT mode?

Well, I ran it as root both with HT turned on and off.  Both times I got this

        CPU0IST  3ffefbe7 277
        can't decode CPU0IST
        CPU1IST  3ffefb60 87
        can't decode CPU1IST
        CPU0CST  3ffef988 1d8
        can't decode CPU0IST
        CPU1CST  3ffef92c 5c
        can't decode CPU1IST

Some other comments about HT mode.  About 50% of the time when HT is turned on
the bootup sequence will oops and hang somewhere.  I don't know how to get the
output from the oops since it never gets to a single user shell.  The rest of
the time it will boot up fine and work in SMP mode.  The frequency scaling
seems to work fine but I get a lot of these messages in my log

        acpi-cpufreq: Transition failed

I don't seem to get those when not running with HT on.

Let me know if there is a different program I can run to get those tables

-- 
  Matthew Harrell                          There are only 10 types of people in
  Bit Twiddlers, Inc.                       this world: those who understand
  mharrell@bittwiddlers.com                 binary and those who don't.
