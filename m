From: Andrew Morton <akpm@osdl.org>
Subject: Re: [x86_64] Exception when using powernowd.
Date: Fri, 2 Sep 2005 17:24:37 -0700
Message-ID: <20050902172437.7e8ceabd.akpm@osdl.org>
References: <20050903.021820.1300541056.whatisthis@jcom.home.ne.jp>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1161080AbVICAYp@vger.kernel.org>
In-Reply-To: <20050903.021820.1300541056.whatisthis@jcom.home.ne.jp>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Kyuma Ohta <whatisthis@jcom.home.ne.jp>
Cc: linux-kernel@vger.kernel.org, cpufreq@lists.linux.org.uk

Kyuma Ohta <whatisthis@jcom.home.ne.jp> wrote:
>
> I'm using MSI K8T Neo2 (VIA K8T800 chipset) and Athlon64 3000+
> with  linux x86_64 2.6.13 kernel and Debian/sid.
> When enable powernow-k8 (i.e. using powernowd,cpudyn) to
> saving power, some process is down by null protection and
> system is unstable.
> Then disabling powernow-k8,and reboot, system is very stable.
> 
> I attach any log,please give me a advice.

Did earlier kernels work OK?  Can you identify the most recent 2.6 kernel
which didn't have this bug?
