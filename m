From: "Prashanth Tamraparni" <prasht@gmail.com>
Subject: Re: failed to load cpufreq
Date: Fri, 25 May 2007 10:16:39 +0530
Message-ID: <be6e8fb10705242146v7e005d1dp153e5ac81043bd3f@mail.gmail.com>
References: <be6e8fb10705240351q575b59e5u3f44db8e4daaa119@mail.gmail.com>
	<20070524130842.GA4869@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=hnVwiOyMP1ayFLMtUmf6hhzfSwHG9nDG0OM4MIMMsLYPgKkgjjouYtAANnj1MpJ/YneoTACbbKgaTmwKzc+dF7VO6pMINJ7Pvbe8+1S9uJN8AmJWj4fSOvWdbyLAotXxJBD/MKSPqUeOC2Kh+TamsTLA0/LSG7NuxqUT6SgyUog=
In-Reply-To: <20070524130842.GA4869@redhat.com>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@lists.linux.org.uk

Dave,
I tried with latest 2.6.21.3 from LKML and I see exactly the same messages.

cpufreq-core: trying to register driver centrino
cpufreq-core: adding CPU 0
speedstep-centrino: found unsupported CPU with Enhanced SpeedStep:
send /proc/cpuinfo to cpufreq@lists.linux.org.uk
cpufreq-core: initialization failed
cpufreq-core: adding CPU 1
cpufreq-core: initialization failed
cpufreq-core: adding CPU 2
cpufreq-core: initialization failed
cpufreq-core: adding CPU 3
cpufreq-core: initialization failed
cpufreq-core: no CPU initialized for driver centrino
cpufreq-core: unregistering CPU 0
cpufreq-core: unregistering CPU 1
cpufreq-core: unregistering CPU 2
cpufreq-core: unregistering CPU 3
.....
.....
acpi-cpufreq: acpi_cpufreq_init
acpi-cpufreq: acpi_cpufreq_early_init
cpufreq-core: trying to register driver acpi-cpufreq
cpufreq-core: adding CPU 0
acpi-cpufreq: acpi_cpufreq_cpu_init
cpufreq-core: initialization failed
cpufreq-core: adding CPU 1
acpi-cpufreq: acpi_cpufreq_cpu_init
cpufreq-core: initialization failed
cpufreq-core: adding CPU 2
acpi-cpufreq: acpi_cpufreq_cpu_init
cpufreq-core: initialization failed
cpufreq-core: adding CPU 3
acpi-cpufreq: acpi_cpufreq_cpu_init
cpufreq-core: initialization failed
cpufreq-core: no CPU initialized for driver acpi-cpufreq
cpufreq-core: unregistering CPU 0
cpufreq-core: unregistering CPU 1
cpufreq-core: unregistering CPU 2
cpufreq-core: unregistering CPU 3

thanks
Prashanth
On 5/24/07, Dave Jones <davej@redhat.com> wrote:
> On Thu, May 24, 2007 at 04:21:31PM +0530, Prashanth Tamraparni wrote:
>  > Hi,
>  > I am pretty new to using cpufreq and wanted to try on one of my test
>  > system based on 2.6.18 kernel.  It failed to load speedstep-centrino:
>
> A lot has changed in the year and a half since that kernel.
> Please try acpi-cpufreq on a current kernel.
>
>         Dave
>
> --
> http://www.codemonkey.org.uk
>
