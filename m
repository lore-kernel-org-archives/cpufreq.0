From: Jeremy Fitzhardinge <jeremy@goop.org>
Subject: Re: 2.6.16.x CPUFREQ / SpeedStep-Centrino:
	couldn't	enable	EnchancedSpeedStep
Date: Tue, 20 Jun 2006 14:59:00 -0700
Message-ID: <44986FA4.4070906@goop.org>
References: <EB12A50964762B4D8111D55B764A8454192827@scsmsx413.amr.corp.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <EB12A50964762B4D8111D55B764A8454192827@scsmsx413.amr.corp.intel.com>
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
Cc: cpufreq@lists.linux.org.uk, Ben Kevan <ben.kevan@gmail.com>, Bruno Ducrot <ducrot@poupinou.org>, linux@brodo.de

Pallipadi, Venkatesh wrote:
> Also, you can try disabling CONFIG_X86_SPEEDSTEP_CENTRINO_ACPI and see
> whether the hardcoded tables works for you.
>   
It's also failing because it can't set MSR_IA32_MISC_ENABLE, so it 
simply can't write to  MSR_IA32_PERF_CTL.

    J
