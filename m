From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: speedstep-ich and ich5, [speedstep]
Date: Wed, 11 Aug 2004 21:42:46 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040811194246.GA13362@dominikbrodowski.de>
References: <4114D272.6070808@versanet.de>
	<20040807131432.GA8934@dominikbrodowski.de>
	<4114E9C1.8070409@versanet.de>
	<20040808175726.GA15268@dominikbrodowski.de>
	<4116A003.600@versanet.de>
	<20040809204940.GA10802@dominikbrodowski.de>
	<4118FE2C.8080508@versanet.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <4118FE2C.8080508@versanet.de>
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
To: Christian Heimanns <heimanns@versanet.de>
Cc: cpufreq <cpufreq@www.linux.org.uk>

On Tue, Aug 10, 2004 at 06:56:12PM +0200, Christian Heimanns wrote:
> Dominik Brodowski wrote:
> 
> >Back to the original problem: pstate_cnt doesn't work, disabling irqs
> >doesn't work... I'm running out of ideas at the moment. Hopefully new ideas
> >will appear soon... in the meantime, could you send a lspci [no additional 
> >options needed] again, please?
> 
> No problem, see attachement please.
> 
> Christian

What we haven't looked at yet is the raw DSDT output. Can you run the DSDT
and/or SSDTs through "iasl -d", please? You'll need the pmtools and the
iasl compiler and disassembler, and they're available at http://acpi.sf.net

acpidmp > acpidmp.txt
acpixtract SSDT acpidmp.txt > SSDT
iasl -d SSDT
cat SSDT.dsl

for the SSDT, and s/SSDT/DSDT for the DSDT.

Thanks,
	Dominik
