From: "Roedel, Joerg" <Joerg.Roedel@amd.com>
Subject: Re: [PATCH 3/6] PCI / Intel IOMMU: Use syscore_ops instead of
 sysdev class and sysdev
Date: Wed, 23 Mar 2011 08:48:45 +0100
Message-ID: <20110323074845.GE20444@amd.com>
References: <201103100131.58206.rjw@sisk.pl>
 <201103220036.17824.rjw@sisk.pl>
 <20110322105738.GC20444@amd.com>
 <201103222307.21983.rjw@sisk.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201103222307.21983.rjw@sisk.pl>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Linux PM mailing list <linux-pm@lists.linux-foundation.org>, "H. Peter Anvin" <hpa@zytor.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, Greg KH <gregkh@suse.de>, LKML <linux-kernel@vger.kernel.org>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, "mingo@redhat.com" <mingo@redhat.com>, Alan Stern <stern@rowland.harvard.edu>, Avi Kivity <avi@redhat.com>, Kay Sievers <kay.sievers@suse.de>, Dave Jones <davej@redhat.com>, "tglx@linutronix.de" <tglx@linutronix.de>, David Woodhouse <dwmw2@infradead.org>

On Tue, Mar 22, 2011 at 06:07:21PM -0400, Rafael J. Wysocki wrote:
> On Tuesday, March 22, 2011, Joerg Roedel wrote:
> > On Mon, Mar 21, 2011 at 07:36:17PM -0400, Rafael J. Wysocki wrote:
> > >  drivers/pci/intel-iommu.c |   38 +++++++++-----------------------------
> > >  1 file changed, 9 insertions(+), 29 deletions(-)
> > 
> > Looks good.
> 
> May I take that as an ACK?

Sure :-)
 
> > I prepare a patch to convert AMD IOMMU to syscore_ops too.
> 
> Already done.  :-)
> 
> It's a part of patch [1/6].

I see, saves me work, thanks :-)

	Joerg

-- 
AMD Operating System Research Center

Advanced Micro Devices GmbH Einsteinring 24 85609 Dornach
General Managers: Alberto Bozzo, Andrew Bowd
Registration: Dornach, Landkr. Muenchen; Registerger. Muenchen, HRB Nr. 43632
