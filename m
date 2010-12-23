From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH 0/6] cpufreq: Add sampling window to enhance ondemand
 governor power efficiency
Date: Thu, 23 Dec 2010 12:34:02 -0500
Message-ID: <20101223173402.GA3821@redhat.com>
References: <1293085424-18212-1-git-send-email-youquan.song@intel.com>
 <20101223110020.GC18363@comet.dominikbrodowski.net>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20101223110020.GC18363@comet.dominikbrodowski.net>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dominik Brodowski <linux@dominikbrodowski.net>, Youquan Song <youquan.song@intel.com>, cpufreq@vger.kernel.org, venki@google.com, arjan@linux.intel.com, lenb@kernel.org, suresh.b.sidd

On Thu, Dec 23, 2010 at 12:00:20PM +0100, Dominik Brodowski wrote:
 > Interesting approach, but seems to be quite different from what "ondemand"
 > does at the moment. And, as David Niemi pointed out, it seems to be more
 > Intel-specific. Therefore, what do you think about adding this different
 > algorithm as a different governor, and keep the "ondemand" algorithm more or
 > less as it is?

I'm hesitant to merge more governors. (We already have too many imo).
The userspace logic for automatically deciding which is the best one to use is
already pretty hairy, so any additional ones at this point would have to be
accompanied with some really compelling reasons why the existing ones can't
be fixed in an acceptable manner.

	Dave
