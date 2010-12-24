From: Youquan Song <youquan.song@linux.intel.com>
Subject: Re: [PATCH 0/6] cpufreq: Add sampling window to enhance ondemand
	governor power efficiency
Date: Thu, 23 Dec 2010 22:06:27 -0500
Message-ID: <20101224030627.GA9850@linux-youquan.bj.intel.com>
References: <1293085424-18212-1-git-send-email-youquan.song@intel.com> <20101223110020.GC18363@comet.dominikbrodowski.net>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20101223110020.GC18363@comet.dominikbrodowski.net>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dominik Brodowski <linux@dominikbrodowski.net>, Youquan Song <youquan.song@intel.com>, davej@redhat.com, cpufreq@vger.kernel.org, venki@google.com, arjan@linux.intel.com, lenb@kernel.

> Interesting approach, but seems to be quite different from what "ondemand"
> does at the moment. And, as David Niemi pointed out, it seems to be more
> Intel-specific. Therefore, what do you think about adding this different
> algorithm as a different governor, and keep the "ondemand" algorithm more or
> less as it is?

Good suggestion! I will write a different governor soon if nobody
oppose.

Thanks
-Youquan
