From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] xen/acpi-processor: C and P-state driver that
 uploads said data to hypervisor.
Date: Tue, 13 Mar 2012 08:21:36 +0000
Message-ID: <4F5F11A00200007800077DD4@nat28.tlf.novell.com>
References: <1331395500-28033-1-git-send-email-konrad.wilk@oracle.com>
 <1331395500-28033-2-git-send-email-konrad.wilk@oracle.com>
 <4F5DE5AD02000078000779CC@nat28.tlf.novell.com>
 <20120312150729.GB4236@phenom.dumpdata.com>
 <4F5E23CA0200007800077B90@nat28.tlf.novell.com>
 <20120313033541.GB17536@phenom.dumpdata.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <20120313033541.GB17536@phenom.dumpdata.com>
Content-Disposition: inline
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: mike.mcclurg@citrix.com, ke.yu@intel.com, kevin.tian@intel.com, xen-devel@lists.xensource.com, davej@redhat.com, cpufreq@vger.kernel.org, linux-kernel@vger.kernel.org

>>> On 13.03.12 at 04:35, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com> wrote:
> +static unsigned int __init get_max_acpi_id(void)
> +{
> +	struct xenpf_pcpuinfo *info;
> +	struct xen_platform_op op = {
> +		.cmd = XENPF_get_cpuinfo,
> +		.interface_version = XENPF_INTERFACE_VERSION,
> +	};
> +	int ret = 0;
> +	unsigned int i, max_apic_id, max_acpi_id = 0;
> +
> +	info = &op.u.pcpu_info;
> +	info->xen_cpuid = 0;
> +
> +	ret = HYPERVISOR_dom0_op(&op);
> +	if (ret)
> +		return max_acpi_id;
> +
> +	/* The max_present is the same irregardless of the xen_cpuid */
> +	max_apic_id = op.u.pcpu_info.max_present;

The 'apic' in the name here is confusing, as this isn't an APIC ID, but
(Xen) ID of the last present CPU (i.e. one less than the maximum
count).

> +	for (i = 0; i <= max_apic_id; i++) {
> +		info->xen_cpuid = i;
> +		ret = HYPERVISOR_dom0_op(&op);
> +		if (ret)
> +			continue;
> +		max_acpi_id = max(info->acpi_id, max_acpi_id);
> +	}
> +	pr_debug(DRV_NAME "Max ACPI ID: %u\n", max_acpi_id);
> +	return max_acpi_id;

Iirc hotplug CPUs may not be represented in MADT, and hence I'd
suggest adding some slack here (e.g. doubling the value).

> +}

Now, if the whole thing could become a true extension to processor.ko,
the fishy (and too weak in the 'm' case, as you noted yourself) Kconfig
dependency on the cpufreq drivers could go away, since both
acpi-cpufreq and powernow-k8 depend on ACPI_PROCESSOR. Which
would at once put it on par with the XenoLinux placement (in terms of
the point in time when it gets executed) of the code.

Jan

