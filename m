From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: powernow-k8 won't load on Athlon64
Date: Wed, 25 Aug 2004 16:50:54 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040825145054.GN29560@poupinou.org>
References: <84EA05E2CA77634C82730353CBE3A8439913D5@SAUSEXMB1.amd.com>
	<20040825093156.GM29560@poupinou.org> <cgi57v$pga$1@sea.gmane.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <cgi57v$pga$1@sea.gmane.org>
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
To: Ari Pollak <ajp@aripollak.com>
Cc: cpufreq@www.linux.org.uk

Hi,

On Wed, Aug 25, 2004 at 09:46:42AM -0400, Ari Pollak wrote:
> Thanks! I just tried this patch out and it seems to work properly:
> ACPI: Processor [CPU1] (supports C1)
> powernow-k8: Found 1 AMD Athlon 64 / Opteron processors (version 1.00.09b)
> powernow-k8:    0 : fid 0xc (2000 MHz), vid 0x2 (1500 mV)
> powernow-k8:    1 : fid 0xa (1800 MHz), vid 0x6 (1400 mV)
> powernow-k8:    2 : fid 0x2 (1000 MHz), vid 0x12 (1100 mV)
> powernow-k8: cpu_init done, current fid 0xc, vid 0x2
> 
> Unfortunately, bumping the CPU speed down to 1 GHz doesn't seem to make 
> the CPU run any cooler or the CPU fan run any slower :(

Could you please run 'bogomips' in order to check that at least the cpu
is slower?  (on debian, it's just apt-get install sysutils, for other
systems, I must admit I don't know).

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
