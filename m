From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH] cpufreq bug fixes (stable/cpufreq.bugfixes) for 3.0 (or
 3.1).
Date: Wed, 15 Jun 2011 15:26:30 -0400
Message-ID: <20110615192630.GC19704@redhat.com>
References: <1308164520-14145-1-git-send-email-konrad.wilk@oracle.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1308164520-14145-1-git-send-email-konrad.wilk@oracle.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: linux-kernel@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, cpufreq@vger.kernel.org

On Wed, Jun 15, 2011 at 03:01:58PM -0400, Konrad Rzeszutek Wilk wrote:
 > The two patches attached make the cpufreq and powernowk8 driver more robust on
 > badly behaving machines (or hypervisors not passing through proper rmsdr calls).

I applied these (after fixing up the change of filename in the powernow driver)
I'll send Linus a pull req to make sure these get into 3.0 later.

thanks,

	Dave
