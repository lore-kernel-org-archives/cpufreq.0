From: Joerg Roedel <joerg.roedel@amd.com>
Subject: Re: [PATCH 3/6] PCI / Intel IOMMU: Use syscore_ops instead of
 sysdev class and sysdev
Date: Tue, 22 Mar 2011 11:57:38 +0100
Message-ID: <20110322105738.GC20444@amd.com>
References: <201103100131.58206.rjw@sisk.pl>
 <201103122212.40828.rjw@sisk.pl>
 <201103220031.22729.rjw@sisk.pl>
 <201103220036.17824.rjw@sisk.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201103220036.17824.rjw@sisk.pl>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Linux PM mailing list <linux-pm@lists.linux-foundation.org>, "H. Peter Anvin" <hpa@zytor.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, Greg KH <gregkh@suse.de>, LKML <linux-kernel@vger.kernel.org>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, "mingo@redhat.com" <mingo@redhat.com>, Alan Stern <stern@rowland.harvard.edu>, Avi Kivity <avi@redhat.com>, Kay Sievers <kay.sievers@suse.de>, Dave Jones <davej@redhat.com>, "tglx@linutronix.de" <tglx@linutronix.de>, David Woodhouse <dwmw2@infradead.org>

On Mon, Mar 21, 2011 at 07:36:17PM -0400, Rafael J. Wysocki wrote:
>  drivers/pci/intel-iommu.c |   38 +++++++++-----------------------------
>  1 file changed, 9 insertions(+), 29 deletions(-)

Looks good. I prepare a patch to convert AMD IOMMU to syscore_ops too.

	Joerg

-- 
AMD Operating System Research Center

Advanced Micro Devices GmbH Einsteinring 24 85609 Dornach
General Managers: Alberto Bozzo, Andrew Bowd
Registration: Dornach, Landkr. Muenchen; Registerger. Muenchen, HRB Nr. 43632

