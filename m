From: Edward Statham <edward.statham@gmail.com>
Subject: CPU frequency governor problem
Date: Tue, 15 Aug 2017 14:47:26 +1200
Message-ID: <CAMn+H1sk267Er5zS2jRmDUE_s+f8Fguq8K40ZpDQG656LcLnBg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=yuGxGJja7VKo9Di3lHRs41jKLFB/hJl4VDbVIKu54DY=;
        b=i2Q6xEfjIh2iaJWWowyypzdB6/mDxwTJ1wtW5qxhPK3UmJrgssXcINg9hgnVj/iG8X
         8Unremj1oPpWQgi5TYTR9s2CrkqjlKA25+UPF9ridWY2e1PtEzMtIvykFGIsXc8pKqfK
         cB5PPI94bCruksjHtWTRVGjDa1IfKM+hL9Ulp58R3SYl16ogyASr+SqU45tCPiLKVceU
         Elk+LVHE4oAOqVb+gMzQWhb9JJZyA+YqX6+CRfFt2JkvFqFUN9JYUMlwA+q2nn5HC7rw
         FsFNwSbf+VGpAiJWDRSmPJF2ChHFwx6f6zJ+x7c7NPHFL4JLW28Ua+lZwVCijVWGPHM5
         TZRw==
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: cpufreq@vger.kernel.org

Hi, sorry for the direct email but I=E2=80=99ve been unable to find a resol=
ution
to this in forums etc.  I have a laptop with a Intel i7-7700HQ CPU and am
running Linux Mint 18.  The frequency governor is set to performance but
it keeps on throttling down to 70% or even 50% and getting stuck there,
for example:

cat /sys/devices/system/cpu/intel_pstate/max_perf_pct
70

I can=E2=80=99t find a way to get it to throttle sensibly i.e. lower the ma=
x
when required but revert to full speed when other conditions allow. I=E2=80=
=99ve
tried the ondemand and performance governors.

Any suggestions would be much appreciated.

thanks,
Ed
