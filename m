From: jy <jy454@yahoo.fr>
Subject: Re: Acer Aspire  1350 broken PST
Date: Fri, 16 Apr 2004 23:27:34 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <c5pj46$dvr$1@sea.gmane.org>
References: <c5n0ms$7nc$1@sea.gmane.org>
	<20040416120519.GT8953@poupinou.org>	<c5osds$fed$1@sea.gmane.org>
	<20040416151135.GV8953@poupinou.org>	<c5otiu$ime$1@sea.gmane.org>
	<20040416152432.GW8953@poupinou.org>	<c5p3e0$6js$1@sea.gmane.org>
	<20040416182013.GZ8953@poupinou.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040416182013.GZ8953@poupinou.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq@www.linux.org.uk

Bruno Ducrot wrote:
> On Fri, Apr 16, 2004 at 06:59:43PM +0200, jy wrote:
> 
>>Bruno Ducrot wrote:
>>
>>>On Fri, Apr 16, 2004 at 05:19:56PM +0200, jy wrote:
>>>
>>>Ok.  I expected that BIOS will put the frequency at max at POST stage.
>>>That is not true for your laptop indeed.  Can you try that patch:
>>
>>Yes, when I bought the laptop the speed was always 800Mhz without any 
>>powernow driver in windows. Maybe the bios here is useful  : 
>>ftp://ftp.support.acer-euro.com/notebook/aspire_1350/bios/zp13a18.zip
>>the changelog in the zip talks about a low speed patch
> 
> 
> I don't know if that bios will help you.  Latest bios for Acer Aspire
> 1310 do give weird result both with PSB/PST method and ACPI (ACPI is
> less buggy)..
> 
> See http://bugme.osdl.org/show_bug.cgi?id=2025
> 

> 
> Try with UP kernel.  At that time, cpufreq break TSC timer on SMP
> kernels.  Or alternatively use the ACPI-timer.
> 

Thank you for your support, Now all is fine
folding@home run well and i'll soon be able to play ut2004.

JY
