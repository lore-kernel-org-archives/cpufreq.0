From: Avi Kivity <avi@redhat.com>
Subject: Re: [PATCH 4/6] KVM: Use syscore_ops instead of sysdev class and
 sysdev
Date: Tue, 22 Mar 2011 11:18:36 +0200
Message-ID: <4D88696C.6060203@redhat.com>
References: <201103100131.58206.rjw@sisk.pl> <201103122212.40828.rjw@sisk.pl> <201103220031.22729.rjw@sisk.pl> <201103220037.06465.rjw@sisk.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <201103220037.06465.rjw@sisk.pl>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Linux PM mailing list <linux-pm@lists.linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, Greg KH <gregkh@suse.de>, Kay Sievers <kay.sievers@suse.de>, Jesse Barnes <jbarnes@virtuousgeek.org>, "H. Peter Anvin" <hpa@zytor.com>, mingo@redhat.com, tglx@linutronix.de, Dave Jones <davej@redhat.com>, Alan Stern <stern@rowland.harvard.edu>, David Woodhouse <dwmw2@infradead.org>, kvm@vger.kernel.org, iommu@lists.linux-foundation.org, cpufreq@vger.kernel.org

On 03/22/2011 01:37 AM, Rafael J. Wysocki wrote:
> From: Rafael J. Wysocki<rjw@sisk.pl>
>
> KVM uses a sysdev class and a sysdev for executing kvm_suspend()
> after interrupts have been turned off on the boot CPU (during system
> suspend) and for executing kvm_resume() before turning on interrupts
> on the boot CPU (during system resume).  However, since both of these
> functions ignore their arguments, the entire mechanism may be
> replaced with a struct syscore_ops object which is simpler.
>

Acked-by: Avi Kivity <avi@redhat.com>

-- 
error compiling committee.c: too many arguments to function

