From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: [PATCH 0/5] Add P state driver for Intel Core Processors
Date: Thu, 14 Feb 2013 18:36:13 +0100
Message-ID: <1732008.aLNltyhYYo@vostro.rjw.lan>
References: <1360170133-5066-1-git-send-email-dirk.brandewie@gmail.com> <1540905.Sh9giL2bZe@vostro.rjw.lan> <511D0420.8080608@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <511D0420.8080608@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dirk Brandewie <dirk.brandewie@gmail.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, Dave Jones <davej@redhat.com>, linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org

On Thursday, February 14, 2013 07:34:56 AM Dirk Brandewie wrote:
> On 02/14/2013 04:21 AM, Rafael J. Wysocki wrote:
> > On Thursday, February 14, 2013 09:38:21 AM Viresh Kumar wrote:
> >> On Wed, Feb 13, 2013 at 10:08 PM, Dirk Brandewie
> >> <dirk.brandewie@gmail.com> wrote:
> >>> For the case where both are built-in the load order works my driver uses
> >>> device_initcall() and acpi_cpufreq uses late_initcall().
> >>>
> >>> For the case where both are a module (which I was sure I tested) you are
> >>> right
> >>> I will have to do something.
> >>>
> >>> For now I propose to make my driver built-in only while I sort out the right
> >>> solution for the module build.  Does this seem reasonable to everyone?
> >>
> >> Of-course i am missing something here. Why would anybody want to insert
> >> acpi-cpufreq module when the system supports the pstate driver.
> >>
> >> In case they are mutually exclusive, then we can have something like
> >> depends on !ACPI-DRIVER in the kconfig option of pstate driver.
> >
> > Yes.  Or the other way around (i.e. make acpi_cpufreq depend on
> > !X86_INTEL_PSTATE).
> >
> 
> The issue is that acpi-cpufreq still needs to be available for Intel processors 
> before SandyBridge and for other x86 compatible processors we can't make
> intel_pstate and acpi-cpufreq mutually exclusive.

Right, I forgot about that and recalled it just a minute after sending that
message.
 
> Having intel_pstate built-in solves the issue without the need to patch
> acpi-cpufreq.  I believe that most distros build the scaling drivers in
> so the distro/user will make the explicit decision to use intel_pstate.

But then we need to allow the user to choose acpi_cpufreq anyway if it's
preferred whatever the reason.

Thanks,
Rafael


-- 
I speak only for myself.
Rafael J. Wysocki, Intel Open Source Technology Center.
