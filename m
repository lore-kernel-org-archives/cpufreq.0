From: Pavel Machek <pavel@ucw.cz>
Subject: Re: Cleanups for powernow-k8
Date: Wed, 14 Jan 2004 01:03:52 +0100
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20040114000352.GB25158@elf.ucw.cz>
References: <99F2150714F93F448942F9A9F112634C080EF392@txexmtae.amd.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <99F2150714F93F448942F9A9F112634C080EF392@txexmtae.amd.com>
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
To: paul.devriendt@amd.com
Cc: davej@redhat.com, linux-kernel@vger.kernel.org, cpufreq@www.linux.org.uk, pavel@ucw.cz, linux@brodo.de

Hi!

> I have a totally new driver, that I am hoping to release within about
> a month. (I did target the end of the year, but I got distracted on
> some other stuff). The new driver :
>   - uses ACPI to figure out the available p-states. I have seen a *lot*
>     of buggy BIOSs where the PSB/PST info is wrong or missing,
>   - uses ACPI to handle battery / mains power transitions,
> and some other clean ups.
> 
> I would appreciate some advice on a question ... should I leave the old
> non-ACPI capability there for those people who do not want to enable ACPI
> in the kernel ? If so, is this a big ifdef, or is there a better way to do
> it ? Or should I just say that it is dependent on ACPI, got to have
> ACPI ?

I have strange notebook here, and that one only works reasonably with
APM (with ACPI: no network IRQs, random mouse problems, random
shutdowns due to bad temperature readings).

I'd suggest to leave old driver there (possibly let me clean it up
;-)))), and create new powernow-k8-acpi, or powernow-acpi or something
like that.
								Pavel
-- 
When do you have heart between your knees?
