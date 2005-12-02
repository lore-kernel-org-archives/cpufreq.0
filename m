From: Felix Braun <Felix.Braun@mail.mcgill.ca>
Subject: Re: [PATCH 2.6.14] cpufreq: don't suggest speedstep-centrino for
 Dothan-based Celeron-M processors
Date: Fri, 2 Dec 2005 15:52:35 +0100
Message-ID: <20051202155235.1e83e932@tilion.getrex.org>
References: <88056F38E9E48644A0F562A38C64FB60067F3B26@scsmsx403.amr.corp.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <88056F38E9E48644A0F562A38C64FB60067F3B26@scsmsx403.amr.corp.intel.com>
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
Content-Type: text/plain; charset="us-ascii"
To: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Cc: CPUFreq@lists.linux.org.uk, Dominik Brodowski <linux@dominikbrodowski.net>, davej@redhat.com


On Fri, 02 Dec 2005 06:26:52 -0800 "Pallipadi, Venkatesh"
<venkatesh.pallipadi@intel.com> wrote:

> P4-clockmod will only do the duty-cycle based throttling and will
> not save any significant power. In fact, CPU may end up consuming more
> power than without it [...]. It will only help in thermal conditions
> and ACPI throttling driver should handle that anyway.

By "ACPI throttling driver" do you mean arch/i386/.../acpi_cpufreq? That
driver didn't work for me :-( I get a error: no such device when I try to
load it as a module. I haven't looked into that yet.

Anyway, thanks a lot for the information

Felix
