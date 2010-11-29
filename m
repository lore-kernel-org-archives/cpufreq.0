From: Vishwanath Sripathy <vishwanath.sripathy-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: Issues with ondemand governor
Date: Mon, 29 Nov 2010 14:35:38 +0530
Message-ID: <AANLkTi=Jx2GQDotWiD3iCF7gqdYixg7Lq5Mru7t=9vGF@mail.gmail.com>
References: <AANLkTi=0hbJ=N6bLRgrmDVzMVZgPyT5gNZbQDhgMV=J=@mail.gmail.com>
	<4CEA959F.9000505@verisign.com>
	<20101126223815.GU30563@anthem.async.com.br>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
In-Reply-To: <20101126223815.GU30563-J1k5CargkBPB0jqWMgOSsQh0onu2mTI+@public.gmane.org>
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
To: Christian Robottom Reis <kiko-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: David C Niemi <dniemi-0nFLJxsdniVWk0Htik3J/w@public.gmane.org>, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, cpufreq-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Nicolas,
Can you pls merge this patch into Linaro tree?

Vishwa

On Sat, Nov 27, 2010 at 4:08 AM, Christian Robottom Reis
<kiko-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Mon, Nov 22, 2010 at 11:09:03AM -0500, David C Niemi wrote:
>> The general problem here is that the ondemand governor is aimed more at
>> power savings than performance. =A0In cases where the ondemand governor
>> performs worse than the performance governor, the "sampling_down_factor"
>> tunable is often useful. =A0I submitted the patch to add this tunable a
>> few weeks ago and it was acked by Venki, but I don't know what happened
>> to it after that.
>
> Would you like to get it merged into linux-linaro? Given it's been ack'd
> I think Nicolas might be willing to consider it:
>
> =A0 =A0http://kerneltrap.org/mailarchive/linux-kernel/2010/10/6/4628889/t=
hread
> --
> Christian Robottom Reis =A0 | [+55] 16 9112 6430 | http://launchpad.net/~=
kiko
> Linaro Engineering VP =A0 =A0 | [ +1] 612 216 4935 | http://async.com.br/=
~kiko
>
