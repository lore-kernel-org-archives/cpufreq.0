From: Patrik Lundquist <patrik.lundquist@gmail.com>
Subject: Re: v3.13.5 intel_pstate: cpufreq: __cpufreq_add_dev: ->get() failed
Date: Wed, 12 Mar 2014 15:14:51 +0100
Message-ID: <CAA7pwKN2Rn2y9TaEYLtwVmJ0_7Syx0kVQHUNga5ga2BwB=q1fQ@mail.gmail.com>
References: <CAA7pwKNmosWaWPR0x3kNzL7eNLk8vdCB=NknU9ayLT9s1fJQYA@mail.gmail.com>
	<531F783B.7010100@gmail.com>
	<2792846.28xTH7a9zW@vostro.rjw.lan>
	<3509059.VnUUJct98J@vostro.rjw.lan>
	<CAA7pwKOgtx8dBSzdu2iBS_f1Xck0MkmHYjQOvsS-8W+HxFkYmg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=UWAuQAbOO3yw/oSGZHIkxsm02DoQj+q6Yg9JWl9Wmx0=;
        b=YS5f9nz83wZAwyikF7X1EJ2iYEyVf3gHNGd1UR/XzqPjM4rW5y3hnIV1puzJiYiBSG
         /So/E55cvbl8Q+TnX6LjK51q9H6+BJYbv9zZG0Qctnx6nfN70T3iWbEugrDR84LTuA0b
         +79VtyzvsVxpC/bej40+iBvXe55IhaeJVltk9yXuR3kQgJhJ3p9nDmhtTGApZeNAsLmr
         MTopyimotalin37fvTinUshAEbJuhQkH2sKFJ1VTLV6mHQ+ZQnJhHtGjPYwn2acD5Mdq
         jM/XRDGjzEls8k5THzNeGbDxkjY8m0qs1sfOA7hKKKr37HR9PVINEaa4rS1R1OuLC3B6
         c6sA==
In-Reply-To: <CAA7pwKOgtx8dBSzdu2iBS_f1Xck0MkmHYjQOvsS-8W+HxFkYmg@mail.gmail.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Dirk Brandewie <dirk.brandewie@gmail.com>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, Linux PM list <linux-pm@vger.kernel.org>

On 12 March 2014 12:42, Patrik Lundquist <patrik.lundquist@gmail.com> wrote:
> On 12 March 2014 00:07, Rafael J. Wysocki <rjw@rjwysocki.net> wrote:
>>
>> So Patrik, please test this one (resending, so that it gets to linux-pm):
>
> Will do. Might take a couple of days.

Come to think of it, there's not much to test besides verifying that
cpufreq_driver->get() isn't called like before (i.e. no need to test
on the server).

So I inserted pr_err()s and they aren't printed when booting my Intel
Xeon CPU E3-1240 V2 while the intel_pstate driver still is used.

The patch works for me.
