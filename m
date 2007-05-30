From: "Prashanth Tamraparni" <prasht@gmail.com>
Subject: Re: failed to load cpufreq
Date: Wed, 30 May 2007 18:30:52 +0530
Message-ID: <be6e8fb10705300600g7412a546i9232baba71c330f4@mail.gmail.com>
References: <be6e8fb10705242146v7e005d1dp153e5ac81043bd3f@mail.gmail.com>
	<653FFBB4508B9042B5D43DC9E18836F5EE13CC@scsmsx415.amr.corp.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=UDT/thKQ4JbFTZB+AXLB40mK0oMxjcIlj0l+3eiUNSApMWCAs0lm9NkRHc4AHPI3OS4qJ0WJ/JtOlkvjutznPZkGNDuez4tkHHQE65qjjXaJnpS05dLXCPJ/IPJ7Q7+5nhk7puYfz+1eYaOwzUT5KN8n8K1izNRSu80M/PREo68=
In-Reply-To: <653FFBB4508B9042B5D43DC9E18836F5EE13CC@scsmsx415.amr.corp.intel.com>
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
To: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Cc: Dave Jones <davej@redhat.com>, cpufreq@lists.linux.org.uk

Thanks Venki...I changed the bios power option to os control mode with
which acpi-cpufreq module worked.

Are there any ways to change cpu voltage in addition to frequency?

--Prashanth

On 5/25/07, Pallipadi, Venkatesh <venkatesh.pallipadi@intel.com> wrote:
>
> Can you attach /proc/cpuinfo here.
> Sometimes BIOSes try to hide this feature behind a BIOS option.
> Check to see whether there are any BIOS options related to this feature.
> Also, make sure you have the latest BIOS for the platform.
>
> Thanks,
> Venki
>
> >-----Original Message-----
> >From: cpufreq-bounces@lists.linux.org.uk
> >[mailto:cpufreq-bounces@lists.linux.org.uk] On Behalf Of
> >Prashanth Tamraparni
> >Sent: Thursday, May 24, 2007 9:47 PM
> >To: Dave Jones
> >Cc: cpufreq@lists.linux.org.uk
> >Subject: Re: failed to load cpufreq
> >
> >Dave,
> >I tried with latest 2.6.21.3 from LKML and I see exactly the
> >same messages.
> >
> >cpufreq-core: trying to register driver centrino
> >cpufreq-core: adding CPU 0
> >speedstep-centrino: found unsupported CPU with Enhanced SpeedStep:
> >send /proc/cpuinfo to cpufreq@lists.linux.org.uk
> >cpufreq-core: initialization failed
> >cpufreq-core: adding CPU 1
> >cpufreq-core: initialization failed
> >cpufreq-core: adding CPU 2
> >cpufreq-core: initialization failed
> >cpufreq-core: adding CPU 3
> >cpufreq-core: initialization failed
> >cpufreq-core: no CPU initialized for driver centrino
> >cpufreq-core: unregistering CPU 0
> >cpufreq-core: unregistering CPU 1
> >cpufreq-core: unregistering CPU 2
> >cpufreq-core: unregistering CPU 3
> >.....
> >.....
> >acpi-cpufreq: acpi_cpufreq_init
> >acpi-cpufreq: acpi_cpufreq_early_init
> >cpufreq-core: trying to register driver acpi-cpufreq
> >cpufreq-core: adding CPU 0
> >acpi-cpufreq: acpi_cpufreq_cpu_init
> >cpufreq-core: initialization failed
> >cpufreq-core: adding CPU 1
> >acpi-cpufreq: acpi_cpufreq_cpu_init
> >cpufreq-core: initialization failed
> >cpufreq-core: adding CPU 2
> >acpi-cpufreq: acpi_cpufreq_cpu_init
> >cpufreq-core: initialization failed
> >cpufreq-core: adding CPU 3
> >acpi-cpufreq: acpi_cpufreq_cpu_init
> >cpufreq-core: initialization failed
> >cpufreq-core: no CPU initialized for driver acpi-cpufreq
> >cpufreq-core: unregistering CPU 0
> >cpufreq-core: unregistering CPU 1
> >cpufreq-core: unregistering CPU 2
> >cpufreq-core: unregistering CPU 3
> >
> >thanks
> >Prashanth
> >On 5/24/07, Dave Jones <davej@redhat.com> wrote:
> >> On Thu, May 24, 2007 at 04:21:31PM +0530, Prashanth Tamraparni wrote:
> >>  > Hi,
> >>  > I am pretty new to using cpufreq and wanted to try on one
> >of my test
> >>  > system based on 2.6.18 kernel.  It failed to load
> >speedstep-centrino:
> >>
> >> A lot has changed in the year and a half since that kernel.
> >> Please try acpi-cpufreq on a current kernel.
> >>
> >>         Dave
> >>
> >> --
> >> http://www.codemonkey.org.uk
> >>
> >
> >_______________________________________________
> >Cpufreq mailing list
> >Cpufreq@lists.linux.org.uk
> >http://lists.linux.org.uk/mailman/listinfo/cpufreq
> >
>
