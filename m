From: Pavel Machek <pavel@ucw.cz>
Subject: Re: powernow-k8, more updates
Date: Wed, 17 Mar 2004 20:52:26 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040317195226.GB287@elf.ucw.cz>
References: <99F2150714F93F448942F9A9F112634C1126A014@txexmtae.amd.com>
	<20040317100745.GA15284@dominikbrodowski.de>
	<20040317120409.GA482@elf.ucw.cz>
	<20040317160408.GP28592@poupinou.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040317160408.GP28592@poupinou.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bruno Ducrot <ducrot@poupinou.org>
Cc: Dominik Brodowski <linux@dominikbrodowski.de>, Cpufreq mailing list <cpufreq@www.linux.org.uk>

Hi!

> > Here are few typo fixes [I believe they are applicable to dominik's
> > latest version]; I cleaned up puinfo_x86 stuff in check_supported_cpu
> > (no ifdefs any more!) and introduced fill_powernow_table helper. It
> > makes code nicer, and makes overriding tables way easier (and you get
> > all the normal checks for your overrident table, so its harder to mess
> > it up). Notice that values are now for my arima (1.8GHz), and I
> > basically guessed them, Paul might have better values. Oh and I now
> > print out frequencies to the user, so that dmesg output is
> > informative.
> > 
> >  
> >  #if 0
> > + override:
> >          /*
> >  	 * hack for machines without a PSB - as an example values for
> > -	 * 2.0/1.8/0.8 GHz are hardcoded. You need to assert that these
> > +	 * 1.8/1.6/0.8 GHz are hardcoded. You need to assert that these
> >  	 * values are correct and supported by your CPU / motherboard
> > +	 *
> ...
> > -	data->powernow_table = powernow_table;
> > -
> > -	return 0;
> >  #endif
> 
> Why not just provide an override from userspace?

Its pretty hard to do, and we actually do not want users overriding
it. I'd prefer this #if 0 to be killed before mainline merge...

								Pavel
-- 
When do you have a heart between your knees?
[Johanka's followup: and *two* hearts?]
