From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [PATCH] cpufreq bug fixes (stable/cpufreq.bugfixes) for 3.0 (or
 3.1).
Date: Wed, 15 Jun 2011 17:13:19 -0400
Message-ID: <20110615211319.GB27438@dumpdata.com>
References: <1308164520-14145-1-git-send-email-konrad.wilk@oracle.com>
 <20110615192630.GC19704@redhat.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110615192630.GC19704@redhat.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Jones <davej@redhat.com>, linux-kernel@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, cpufreq@vger.kernel.org

On Wed, Jun 15, 2011 at 03:26:30PM -0400, Dave Jones wrote:
> On Wed, Jun 15, 2011 at 03:01:58PM -0400, Konrad Rzeszutek Wilk wrote:
>  > The two patches attached make the cpufreq and powernowk8 driver more robust on
>  > badly behaving machines (or hypervisors not passing through proper rmsdr calls).
> 
> I applied these (after fixing up the change of filename in the powernow driver)
> I'll send Linus a pull req to make sure these get into 3.0 later.

Thank you. Sorry about missing the directory move and you having to do extra legwork.
