From: Ducrot Bruno <ducrot@poupinou.org>
Subject: Re: [SPEEDSTEP] ALi shouthbridge.  alpha tester wanted.
Date: Mon, 17 Nov 2003 20:39:47 +0100
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20031117193947.GV32464@poupinou.org>
References: <20031106140935.GC21970@poupinou.org>
	<200311131404.31398.lardel@interia.pl>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <200311131404.31398.lardel@interia.pl>
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
To: Rafal Dejewski <lardel@interia.pl>
Cc: cpufreq ML <cpufreq@www.linux.org.uk>

On Thu, Nov 13, 2003 at 02:04:31PM +0100, Rafal Dejewski wrote:
> On Thursday 06 November 2003 15:09, Ducrot Bruno wrote:
> > Can someone please test
> > ftp://ftp.poupinou.org/cpufreq/speedstep-ali.trunk.diff
> >
> Hi!
> Tried this on HP VT6200 notebook with P4M at 1700MHz running 2.6.0-test9 with 
> APM (without ACPI).
> 
> Here is my dmesg output after "modprobe speedstep_ali":
> cpufreq: read at pmbase 0x8000 + 0x2f returned 0x1
> cpufreq: writing 0x1 to pmbase 0x8000 + 0x50
> cpufreq: read at pmbase 0x8000 + 0x50 returned 0x1
> cpufreq: change to 1700 MHz succeeded
> cpufreq: read at pmbase 0x8000 + 0x2f returned 0x1
> cpufreq: writing 0x0 to pmbase 0x8000 + 0x50
> cpufreq: read at pmbase 0x8000 + 0x50 returned 0x0
> cpufreq: change to 1700 MHz succeeded
> 
> It didn't create cpufreq directory on /sys/devices/system/cpu/cpu0 as 
> p4-clockmod does, so I don't know what to do next...
> 

Can you please send me the output of lspci -xxx, thanks,

-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
