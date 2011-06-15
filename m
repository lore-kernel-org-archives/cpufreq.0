From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [PATCH 1/2] powernow-k8: Don't notify of successful
 transition if we failed.
Date: Wed, 15 Jun 2011 18:26:08 -0400
Message-ID: <20110615222608.GA14031@dumpdata.com>
References: <1308164520-14145-1-git-send-email-konrad.wilk@oracle.com>
 <1308164520-14145-2-git-send-email-konrad.wilk@oracle.com>
 <20110615221636.GB9725@liondog.tnic>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110615221636.GB9725@liondog.tnic>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Borislav Petkov <bp@alien8.de>, linux-kernel@vger.kernel.org, davej@redhat.com, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, cpufreq@vger.kernel.org, andre.prz

> > @@ -1112,6 +1114,9 @@ static int transition_frequency_pstate(struct powernow_k8_data *data,
> >  	}
> >  
> >  	res = transition_pstate(data, pstate);
> > +	if (res)
> > +		return res;
> 
> That's wrong because transition_pstate() returns 0 unconditionally
> (at least it does so on 3.0-rc3). But this change accidentally fixes
> a different bug because res is used uninitialized, containing stack
> garbage otherwise.
> 
> A proper fix should be to check against data->max_hw_pstate and
> check whether the entry is not CPUFREQ_ENTRY_INVALID (look at
> fill_powernow_table_pstate() for example).

Aha! I can respin a patch for that tomorrow.
> 
> I'm guessing this oops happens when powernow-k8 is loaded in the guest
> and that the actual power management is done in the hypervisor?

Yes.
