From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: [PATCH] cpufreq_ondemand
Date: Tue, 19 Oct 2004 20:22:24 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20041019182224.GB22405@poupinou.org>
References: <20041017222916.GA30841@inskipp.digriz.org.uk>
	<4172F3C5.8090604@kolivas.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <4172F3C5.8090604@kolivas.org>
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
To: Con Kolivas <kernel@kolivas.org>
Cc: Alexander Clouter <alex-kernel@digriz.org.uk>, linux-kernel@vger.kernel.org, cpufreq@www.linux.org.uk

Hi,

On Mon, Oct 18, 2004 at 08:35:49AM +1000, Con Kolivas wrote:
> Alexander Clouter wrote:
> >>3. (major) the scaling up and down of the cpufreq is now smoother.  I 
> >>found 
> >	it really nasty that if it tripped < 20% idle time that the freq was 
> >	set to 100%.  This code smoothly increases the cpufreq as well as 
> >	doing a better job of decreasing it too
> 
> I'd much prefer it shot up to 100% or else every time the cpu usage went 
> up there'd be an obvious lag till the machine ran at it's capable speed. 
>  I very much doubt the small amount of time it spent at 100% speed with 
> the default design would decrease the battery life significantly as well.
> 

I'm almost ok with your words, but the amd64 do have unacceptable
latency between min and max freq transition, due to the step-by-step
requirements (200MHz IIRC).
Alexander's governor may be then OK for those kind of processors.

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
