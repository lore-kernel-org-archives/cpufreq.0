From: Ducrot Bruno <ducrot@poupinou.org>
Subject: Re: p4_clockmod or speedstep_ich | acpi?
Date: Sat, 24 Jan 2004 07:03:21 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040124060321.GP25416@poupinou.org>
References: <4011EC55.5030304@sbh.eng.br>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <4011EC55.5030304@sbh.eng.br>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marcus Grando <marcus@sbh.eng.br>
Cc: cpufreq@www.linux.org.uk

On Sat, Jan 24, 2004 at 01:53:57AM -0200, Marcus Grando wrote:
> Hi,
> 
> I have a toshiba satellite a10 127, and use p4 clockmod in cpufreq. I 
> look this kernel messages:
> 
> cpufreq: P4/Xeon(TM) CPU On-Demand Clock Modulation available
> cpufreq: Warning: Pentium 4-M detected. The speedstep-ich or acpi cpufreq
> cpufreq: modules offers voltage scaling in addition of frequency 
> scaling. You
> cpufreq: should use either one instead of p4-clockmod, if possible.
> 

...
> CPU:     After generic identify, caps: bfebf9ff 00000000 00000000 00000000
> CPU:     After vendor identify, caps: bfebf9ff 00000000 00000000 00000000
> CPU: Trace cache: 12K uops, L1 D cache: 8K
> CPU: L2 cache: 256K
> CPU:     After all inits, caps: bfebf9ff 00000000 00000000 00000080
> CPU: Intel Mobile Intel(R) Celeron(R) CPU 2.00GHz stepping 09
                             ^^^^^^^
		  A celeron is not speedstep capable.

Cheers,

-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
