From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: [PATCH] 2.6.5 speedstep on P4Ms
Date: Tue, 8 Jun 2004 17:30:23 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040608153023.GS13782@poupinou.org>
References: <40C5F42D.1050107@cern.ch>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <40C5F42D.1050107@cern.ch>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christian.Hoelbling@cpt.univ-mrs.fr
Cc: cpufreq@www.linux.org.uk

On Tue, Jun 08, 2004 at 05:15:25PM +0000, Christian Hoelbling wrote:
>   hi list,
> 
> i am trying to do a small rewrite of the speedstep-ich driver to 
> address the following issues:
> 
> 1.) detect all P4M's via the model_id string
> 2.) correctly register drivers on hyperthreading CPU's (and stop 
> freeze-ups i occasionally had)
> 3.) do P4-clockmod on top of speedstep on P4-Ms

It would be great if you send 3 differents patches...

Also, I don't think 3) is how thinks should be done.
It would be much more usefull to allow 2 cpufreq drivers to be loaded.
I think it's planed for 2.7 btw.

Cheers,

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
