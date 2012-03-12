From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] xen/acpi-processor: C and P-state driver that
 uploads said data to hypervisor.
Date: Mon, 12 Mar 2012 15:26:50 +0000
Message-ID: <4F5E23CA0200007800077B90@nat28.tlf.novell.com>
References: <1331395500-28033-1-git-send-email-konrad.wilk@oracle.com>
 <1331395500-28033-2-git-send-email-konrad.wilk@oracle.com>
 <4F5DE5AD02000078000779CC@nat28.tlf.novell.com>
 <20120312150729.GB4236@phenom.dumpdata.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <20120312150729.GB4236@phenom.dumpdata.com>
Content-Disposition: inline
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: mike.mcclurg@citrix.com, ke.yu@intel.com, kevin.tian@intel.com, xen-devel@lists.xensource.com, davej@redhat.com, cpufreq@vger.kernel.org, linux-kernel@vger.kernel.org

>>> On 12.03.12 at 16:07, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com> wrote:
> On Mon, Mar 12, 2012 at 11:01:49AM +0000, Jan Beulich wrote:
>> >>> On 10.03.12 at 17:05, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com> wrote:
>> Rather than arbitrarily limiting this, you could call into Xen at startup
>> and scan over all CPUs' ACPI IDs to find the maximum. I think that
>> would even cover statically declared hotplug ones, but adding some
>> slack may still be necessary to cover dynamic hotplug ones (implying
>> that pCPU hotplug patches will make it in at some point).
> 
> This would be the XENPF_get_cpuinfo call right? I do plan on looking at the

Yes.

> pCPU hotplug, but I think I need some fancy hardware to test it correctly?

No, you don't really - for testing these code paths you can soft offline
and then online back CPUs in Xen.

>> > +	register_hotcpu_notifier(&xen_cpu_notifier);
>> 
>> This is pointless - you'd get notified of vCPU-s arrival/departure only.
>> Without pCPU hotplug code in place, there's just nothing you can (and
>> need to) do here.
> 
> I hadn't actually looked in details on the pCPU hotplug code to see how it 
> works.
> 
> I presume I need special hardware for this to work as well as the ACPI
> is involved in triggering the hotplug CPU up calls?

For exercising the ACPI code paths - yes, you'll need suitable
hardware. But for just exercising the notifier logic, as said above,
you don't.

Jan

