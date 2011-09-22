From: Murali N <nalajala.murali@gmail.com>
Subject: Re: on-demand governor behavior on synchronous MP!!!
Date: Thu, 22 Sep 2011 16:19:00 +0530
Message-ID: <CAF0Txbrng=Ew8VmMDCWbdNtuTwOTcpKvw5SLaAJ1YdfL+rNekA@mail.gmail.com>
References: <CAF0TxbrWF+wR68vJqT+KxwgEby+aVv0HKxG4LUsPNH2-WnNRug@mail.gmail.com>
	<CAF0Txboo4_7egbZPan0cWgQ=XG77x3RscbTjjOw0sN0uen1BJg@mail.gmail.com>
	<20110920153209.GA1839@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=ljHr79YZXl5NKPlxN/vNUhzxkrtvNV0w3600IUuDjkY=;
        b=w6fTdeZ6xqIcwWn/KTEc2xKpwY6DRRCvknt79GXaldf2vSIvhng7WVKQo4t7lI0dAt
         R8fMdePQEmxeJMQntIShNj4k1nxGKdQERy8XTQRiaftPRuxt+g30VpS1QYwUTlYetshp
         38ud+3NjgRId5YM6/BKeeipCjEHxcArUtHAPc=
In-Reply-To: <20110920153209.GA1839@redhat.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@vger.kernel.org

On Tue, Sep 20, 2011 at 9:02 PM, Dave Jones <davej@redhat.com> wrote:
> On Thu, Sep 15, 2011 at 12:20:09PM +0530, Murali N wrote:
> =C2=A0> Hi All,
> =C2=A0> I have a MP system where both the cores are running synchrono=
usly i.e.
> =C2=A0> both cores run using the same clock.
> =C2=A0> I would like to know how the "on-demand" governor takes care =
of this
> =C2=A0> scenario? There may be a case where both the cores are runnin=
g but any
> =C2=A0> one of the core is under loaded, how this is handled in on-de=
mand
> =C2=A0> governor?
>
> see policy->related_cpus and ->cpus
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0Dave
>
>

Hi Dave,
"related_cpus" attribute displays the CPUs coordination map. whose
frequency is either coordinated by h/w OR s/w.

from the code i am didn't understood clearly how the cpufreq takes
care of setting the best optimal frequency based on both the cores
load into consideration?

--=20
Regards,
Murali N
