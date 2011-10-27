From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH RESEND] cpufreq: db8500: remove unneeded for loop
 iteration for freq_table
Date: Thu, 27 Oct 2011 10:46:21 -0400
Message-ID: <20111027144621.GA24961@redhat.com>
References: <1319684744.4598.1.camel@phoenix>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1319684744.4598.1.camel@phoenix>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Axel Lin <axel.lin@gmail.com>
Cc: linux-kernel@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, cpufreq@vger.kernel.org

On Thu, Oct 27, 2011 at 11:05:44AM +0800, Axel Lin wrote:
 > We alread did policy->cur = db8500_cpufreq_getspeed(policy->cpu);
 > Don't know why to do the loop iteration here. It looks useless.
 > 
 > Signed-off-by: Axel Lin <axel.lin@gmail.com>

already queued. still waiting for my kernel.org account.
(blocked on waiting for gpg signatures to be uploaded)

	Dave
