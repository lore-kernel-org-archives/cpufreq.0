From: Ducrot Bruno <ducrot@poupinou.org>
Subject: Re: Mobile Athlon XP 1900+ PST table ???
Date: Thu, 18 Sep 2003 12:22:26 +0200
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20030918102226.GH11391@poupinou.org>
References: <20030917085742.78372.qmail@web20807.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20030917085742.78372.qmail@web20807.mail.yahoo.com>
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
To: Alex Simonov <a_simonov@yahoo.com>
Cc: cpufreq@www.linux.org.uk

On Wed, Sep 17, 2003 at 01:57:42AM -0700, Alex Simonov wrote:
> Hello all,
> 
> This mail list is the last hope in my desperate
> efforts to find a solution of my problem.
> Recently the 1GHz Mobile Duron of my Sony Vaio
> FX502 got damaged, so I replaced it with Mobile
> Athlon 1900+ (FSB 100, CPUID 0x781).
> Unfortunately the BIOS supports only up to Athlon
> XP 1600+, so the powernow is not working :( The
> XP 1600+ PST table is the last one of 28
> available PST tables, and has the following data:
> 
> CPUID: 0x780
> FSB: 0x64 (100 MHz)
> max FID: 0x16 (14x)
> start VID: 0xE (1.300V)
> Num states: 6 as follows:
> 
> 1. 0x4 (5x), 0xE (1.300V)
> 2. 0x6 (6x), 0xE (1.300V)
> 3. 0xA (8x), 0xE (1.300V)
> 4. 0xE (10x), 0xE (1.300V)
> 5. 0x2 (12x), 0xE (1.300V)
> 6. 0x16(14x), 0xE (1.300V) 
> 
> Does anybody have the right PST table values for
> Athlon 1900+, FSB100, which I could use to
> override in the CPUFREQ module? If this could
> help, I'm sending the output of x86info utility
> and dmesg of my system.
> 
> Thank you very much to all of you in advance,
> 
> Regards,
> 

Hard to tell, unfortunately.  Not only the CPU but also the voltage
regulator system have to be known.  It may be possible that you can
take at least the values of the one for cpuid 0x780, but
your x86info show that you may be able to make change to vid as well.

If by chance you have a dmesg with the duron in /var/log...

-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
