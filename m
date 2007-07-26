From: "Hiroshi Miura" <miura@da-cha.org>
Subject: Re: [PATCH]gx-suspmod.c use boot_cpu_data instead of current_cpu_data
Date: Thu, 26 Jul 2007 16:55:59 +0900
Message-ID: <a11ccc30707260055y46438459gd618265a4df02ff3@mail.gmail.com>
References: <20070725141905.GA4567@darkstar.te-china.tietoenator.com>
	 <20070724234045.2cec5525.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S932554AbXGZH4U@vger.kernel.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:sender:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references:x-google-sender-auth;
        b=cYE+is+QxI5t4I0ygeTD/jN1TxTFPoHOJNq6qMA3rwPVdFhYrcegB9wFi/bJSEr2huEu0RaUljaHD1bF5gj6GVfBbMfMSooX4FoiNjk20SFQrM7oxRQgtpmGRwyMwtpBzsvY0ajblAbujCZMY+iiMa4MmXXAF3IMmZNabpL+FfY=
In-Reply-To: <20070724234045.2cec5525.akpm@linux-foundation.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-2022-jp"; format="flowed"
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Dave Young <hidave.darkstar@gmail.com>, Dave Jones <davej@codemonkey.org.uk>, linux-kernel@vger.kernel.org, cpufreq@www.linux.org.uk

2007/7/25, Andrew Morton <akpm@linux-foundation.org>:
> On Wed, 25 Jul 2007 14:19:05 +0000 Dave Young <hidave.darkstar@gmail.com> wrote:
>
> > Hi,
> > in preemptible kernel will report BUG: using smp_processor_id() in preemptible, so use boot_cpu_data instead of current_cpu_data.
> >
> > Signed-off-by: Dave Young <hidave.darkstar@gmail.com>
> >
> > ---
> > arch/i386/kernel/cpu/cpufreq/gx-suspmod.c |    4 ++--
> > 1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff -pur linux/arch/i386/kernel/cpu/cpufreq/gx-suspmod.c linux.new/arch/i386/kernel/cpu/cpufreq/gx-suspmod.c
> > --- linux/arch/i386/kernel/cpu/cpufreq/gx-suspmod.c   2007-07-25 14:11:06.000000000 +0000
> > +++ linux.new/arch/i386/kernel/cpu/cpufreq/gx-suspmod.c       2007-07-25 13:57:29.000000000 +0000
> > @@ -181,8 +181,8 @@ static __init struct pci_dev *gx_detect_
> >       struct pci_dev *gx_pci = NULL;
> >
> >       /* check if CPU is a MediaGX or a Geode. */
> > -     if ((current_cpu_data.x86_vendor != X86_VENDOR_NSC) &&
> > -         (current_cpu_data.x86_vendor != X86_VENDOR_CYRIX)) {
> > +     if ((boot_cpu_data.x86_vendor != X86_VENDOR_NSC) &&
> > +         (boot_cpu_data.x86_vendor != X86_VENDOR_CYRIX)) {
> >               dprintk("error: no MediaGX/Geode processor found!\n");
> >               return NULL;
> >       }
>
> um, I suspect it really wants to get at the current CPU.  But putting a
> preempt_disable() around just that code is meaningless: the current CPU
> could change immediately before or after the code block. It needs deeper
> fixing, methinks.

I think we can  remove these part. It checks chipset 's pci id
(vendor id/device id) after this part as follows;

        /* detect which companion chip is used */
        while ((gx_pci = pci_get_device(PCI_ANY_ID, PCI_ANY_ID,
gx_pci)) != NULL) {
                if ((pci_match_id(gx_chipset_tbl, gx_pci)) != NULL)
                        return gx_pci;
        }

It drives cpu frequency  through chipset register, not CPU regsiter.
It may be enough to check chipset pci id.

Hiroshi

-- 
HIroshi Miura
NTT DATA Corp. and IPA OSS center
miura@da-cha.org
（株）NTTデータ /（独）情報処理推進機構
三浦広志
