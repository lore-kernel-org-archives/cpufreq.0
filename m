From: Venkatesh Pallipadi <venki@google.com>
Subject: Re: Improving High-Load Performance with the Ondemand Governor [PATCH ATTACHED]
Date: Wed, 29 Sep 2010 11:18:42 -0700
Message-ID: <AANLkTimpWkrFpSFDr8K+KPf3GNo_owmrr+UoDAhupbeQ@mail.gmail.com>
References: <4C88EF04.1030908@verisign.com>
	<4C928094.7080207@verisign.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=google.com; s=beta;
	t=1285784324; bh=5+SnGFcedYcoiiJn/O0ibSuTnQ0=;
	h=MIME-Version:In-Reply-To:References:Date:Message-ID:Subject:From:
	 To:Cc:Content-Type:Content-Transfer-Encoding;
	b=FxsFxSE7B1A9FXhR1cssqrTFCUm2HB9p8wtIPg9Qj9z8NXPRn5c0rvg8h/37m3z/Y
	 aJEjJhe++193tqMn4/R3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=beta;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=oOxvJpyh2Wl6elwWFjKaqkVS+NefQwGrRxI/oiQR0WI=;
        b=IjyKJGIU8IyUH2VCxz0e0b5k1W/qeqMTzdXJMbk+/95aiXLnN31RblLDB/d6csfDEf
         g+OIOGX/k52bAoxzQTPA==
In-Reply-To: <4C928094.7080207@verisign.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: David C Niemi <dniemi@verisign.com>
Cc: cpufreq@vger.kernel.org

On Thu, Sep 16, 2010 at 1:39 PM, David C Niemi <dniemi@verisign.com> wr=
ote:
> I've been doing more testing, and have a couple of observations. =A0I=
'm
> attaching a minimal form of my changes as a patch for the latest 2.6.=
pre36
> git version of the driver. =A0However, it is difficult for me to test=
 under
> anything other than 2.6.32 (RHEL 6 beta 2), and there are some minor
> differences, though I don't believe they are relevant to my results.
>
> It looks like "io_is_busy" set to 1 is quite beneficial for quickly r=
eacting
> the onset of load.
>
> I do see a lot of downshifting from the top speed when a core is at "=
100%"
> CPU, presumably this means little stalls and lulls, so I expect
> "sampling_down_factor" values greater than 1 continue to be useful an=
d the
> sampling_down_factor continues to be desirable.
>
> I've testing on a dual Xeon X5680 system (other times I've been testi=
ng on
> 2-year-old dual Opterons).
>
> I observe about a 10W power consumption reduction at idle between the
> "performance" governor and the "ondemand" governor. =A0I've seen even=
 bigger
> differences under load, as much as 40 watts, though that could be ass=
ociated
> with some performance differences. =A0I haven't tried to quantify the=
 effect
> of the sampling_down_factor tunable on power consumption under load,
> presumably it increases it, but its usage is voluntary and that is to=
 be
> expected.
>
> I have been unable to find a value of up_threshold that does not swit=
ch
> frequency on at least one core pretty frequently (ranging a couple of=
 times
> a minute to several times a second). =A0However, with fairly fast sam=
pling
> intervals (10000 to 50000) I see pretty quick reaction to load even w=
ith
> UP_THRESHOLD set high (e.g. 50 or even 95). =A0So it is likely my pre=
vious
> efforts to extend the possible values of UP_THRESHOLD from 11 to 5 ar=
e no
> longer necessary, and are not included in the attached patch. =A0Ther=
e are
> other things I would like to consider doing, however, that I'll bring=
 up
> afterwards, but not in this minimal patch.
>

I do see this change in the patch. From the comment above, you did not
want that change?

 #define MICRO_FREQUENCY_UP_THRESHOLD		(95)
 #define MICRO_FREQUENCY_MIN_SAMPLE_RATE		(10000)
-#define MIN_FREQUENCY_UP_THRESHOLD		(11)
+#define MIN_FREQUENCY_UP_THRESHOLD		(5)
 #define MAX_FREQUENCY_UP_THRESHOLD		(100)

The problem with 5 is that when DEF_FREQUENCY_DOWN_DIFFERENTIAL is
used, up_threshold - down_differential calculation in the code can end
up being negative, which is not good.

One minor comment.
+
+	mutex_lock(&dbs_mutex);
+	if (ret !=3D 1 || input > MAX_SAMPLING_DOWN_FACTOR || input < 1) {
+		mutex_unlock(&dbs_mutex);
+		return -EINVAL;
+	}
+
+	dbs_tuners_ins.sampling_down_factor =3D input;

You can move mutex_lock after input validation to make it a bit more cl=
ean.

Otherwise patch looks good. I agree that having sampling_down_factor
as a tunable will be useful under some situations.

Thanks,
Venki
