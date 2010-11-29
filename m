From: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: Issues with ondemand governor
Date: Mon, 29 Nov 2010 10:38:52 -0500 (EST)
Message-ID: <alpine.LFD.2.00.1011291037350.9313@xanadu.home>
References: <AANLkTi=0hbJ=N6bLRgrmDVzMVZgPyT5gNZbQDhgMV=J=@mail.gmail.com>
	<4CEA959F.9000505@verisign.com>
	<20101126223815.GU30563@anthem.async.com.br>
	<4CF3C3B4.3000209@verisign.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
In-Reply-To: <4CF3C3B4.3000209-0nFLJxsdniVWk0Htik3J/w@public.gmane.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: David C Niemi <dniemi-0nFLJxsdniVWk0Htik3J/w@public.gmane.org>
Cc: linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, cpufreq-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Mon, 29 Nov 2010, David C Niemi wrote:

> I certainly have no objections to it going into the Linaro tree, though
> I was hoping to get it into the main kernel tree too.

What might prevent it from going into mainline at the moment, if 
anything?

> Christian Robottom Reis wrote:
> > On Mon, Nov 22, 2010 at 11:09:03AM -0500, David C Niemi wrote:
> >   
> >> The general problem here is that the ondemand governor is aimed more at
> >> power savings than performance.  In cases where the ondemand governor
> >> performs worse than the performance governor, the "sampling_down_factor"
> >> tunable is often useful.  I submitted the patch to add this tunable a
> >> few weeks ago and it was acked by Venki, but I don't know what happened
> >> to it after that.
> >>     
> >
> > Would you like to get it merged into linux-linaro? Given it's been ack'd
> > I think Nicolas might be willing to consider it:
> >
> >     http://kerneltrap.org/mailarchive/linux-kernel/2010/10/6/4628889/thread
> >   
> 
