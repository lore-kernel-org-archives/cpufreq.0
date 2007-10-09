From: Andi Kleen <andi@firstfloor.org>
Subject: Re: [PATCH] architectural pstate driver for powernow-k8
Date: 09 Oct 2007 22:06:39 +0200
Message-ID: <p73fy0k3ve8.fsf@bingen.suse.de>
References: <200710091446.38432.mark.langsdorf@amd.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1755951AbXJIUGw@vger.kernel.org>
In-Reply-To: <200710091446.38432.mark.langsdorf@amd.com>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Langsdorf <mark.langsdorf@amd.com>
Cc: cpufreq@lists.linux.org.uk, linux-kernel@vger.kernel.org

"Mark Langsdorf" <mark.langsdorf@amd.com> writes:

> This patch should apply cleanly to the 2.6.22.6 kernel.

Isn't that a little old? The earliest this could be merged
is the upcomming 2.6.24 tree. Best you submit it against .23
or better -mm.

> This architectural driver should work on all future AMD processors.

That's great. Requiring new powernow drivers all the time was
a little annoying in the past.

-Andi
