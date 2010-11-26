From: Christian Robottom Reis <kiko-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: Issues with ondemand governor
Date: Fri, 26 Nov 2010 20:38:15 -0200
Message-ID: <20101126223815.GU30563@anthem.async.com.br>
References: <AANLkTi=0hbJ=N6bLRgrmDVzMVZgPyT5gNZbQDhgMV=J=@mail.gmail.com>
	<4CEA959F.9000505@verisign.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4CEA959F.9000505-0nFLJxsdniVWk0Htik3J/w@public.gmane.org>
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
To: David C Niemi <dniemi-0nFLJxsdniVWk0Htik3J/w@public.gmane.org>, Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, cpufreq-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Mon, Nov 22, 2010 at 11:09:03AM -0500, David C Niemi wrote:
> The general problem here is that the ondemand governor is aimed more at
> power savings than performance.  In cases where the ondemand governor
> performs worse than the performance governor, the "sampling_down_factor"
> tunable is often useful.  I submitted the patch to add this tunable a
> few weeks ago and it was acked by Venki, but I don't know what happened
> to it after that.

Would you like to get it merged into linux-linaro? Given it's been ack'd
I think Nicolas might be willing to consider it:

    http://kerneltrap.org/mailarchive/linux-kernel/2010/10/6/4628889/thread
-- 
Christian Robottom Reis   | [+55] 16 9112 6430 | http://launchpad.net/~kiko
Linaro Engineering VP     | [ +1] 612 216 4935 | http://async.com.br/~kiko
