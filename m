From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: how to get Pentium 4 multiplier
Date: Thu, 10 Jun 2004 11:07:51 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040610090751.GA3899@dominikbrodowski.de>
References: <3ACA40606221794F80A5670F0AF15F8403BD5535@pdsmsx403>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <3ACA40606221794F80A5670F0AF15F8403BD5535@pdsmsx403>
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
To: "Zhu, Yi" <yi.zhu@intel.com>
Cc: Dave Jones <davej@redhat.com>, cpufreq@www.linux.org.uk

On Thu, Jun 10, 2004 at 01:55:13PM +0800, Zhu, Yi wrote:
> I compiled my 2.6.7-rc3 kernel with SPEEDSTEP_DEBUG and dmesg
> gives:
> 
> speedstep-lib: P4 - MSR_EBC_FREQUENCY_ID: 0xa201f000 0x0
> speedstep-lib: P4 - FSB 100000 kHz; Multiplier 162
> 
> You can find more detailed information here:
> http://bugme.osdl.org/show_bug.cgi?id=2754

Hm, these are the first (two) reports of invalid entries in
MSR_EBC_FREQUENCY_ID for p4(m)s -- on many other systems (including but not
limited to my own) it works fine... maybe this is limited to the D stepping?

> How to resolve?
> 
> My proposal is get the frequency by using the brand string
> (x86_model_id)
> for P4 processors.

Problem is string parsing is ugly, some P4 processors print their speed,
IIRC, in MHz, others in GHz, etc. 

For the p4-clockmod case, we might go back using cpu_khz for determining
current CPU frequency -- and for speedstep-ich and the p4-m problem reported
in the bug, I'd like to get more debug info

	Dominik
