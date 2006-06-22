From: Jeremy Fitzhardinge <jeremy@goop.org>
Subject: Re: CPUFreq ability to overclock
Date: Thu, 22 Jun 2006 11:47:15 -0700
Message-ID: <449AE5B3.8050609@goop.org>
References: <449B0DC0.8070203@aladin.ro>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1751639AbWFVSrF@vger.kernel.org>
In-Reply-To: <449B0DC0.8070203@aladin.ro>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Eduard-Gabriel Munteanu <maxdamage@aladin.ro>
Cc: linux-kernel@vger.kernel.org, cpufreq@lists.linux.org.uk

Eduard-Gabriel Munteanu wrote:
>  I've seen a comment about scaling voltages in cpufreq.c, but it seems 
> there is no actual support for that. 

Cpufreq operates in terms of "operating points" which are 
voltage/frequency pairs, rather than just voltages.  All the CPU drivers 
which support it have a voltage corresponding to each frequency to make 
an operating point.

    J
