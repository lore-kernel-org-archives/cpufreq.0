From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: [PATCH]/[GIT PULL] stable/cpufreq.bugfixes for 3.0 for cpufreq fixes.
Date: Thu, 16 Jun 2011 15:36:37 -0400
Message-ID: <1308253000-6289-1-git-send-email-konrad.wilk@oracle.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, x86@kernel.org, cpufreq@vger.kernel.org, davej@redhat.com, bp@alien8.de, Mark.Langsdorf@amd.com, andre.przywara@amd.com

Hey Dave,

This is a follow up after the initial posting (http://www.gossamer-threads.com/lists/linux/kernel/1394515).

The first patch:
 [PATCH 1/3] [CPUFREQ]: Don't set stat->last_index to -1 if the pol->cur has incorrect value.

is exactly like the first posting, while the second (old) patch was split in two:

 [PATCH 2/3] [CPUFREQ] powernow-k8: Don't notify of successful transition if we failed (vid case).

and the pstate transition code was augmented a bit more:

 [PATCH 3/3] [CPUFREQ] powernow-k8: Don't try to transition if the pstate is incorrect

Also Borislav Acked and reviewed the patches.

Please either:

a). git pull git://git.kernel.org/pub/scm/linux/kernel/git/konrad/xen.git  stable/cpufreq.bugfixes

b) or git am this email thread.

I don't know which way you prefer. The patches have been rebased on top of v3.0-rc3 tag.

Thank you!
