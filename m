From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: Why are the file perns of /sys/devices/system/cpu/cpu*/cpufreq/cpuinfo_cur_freq
 much more rigide ?
Date: Tue, 1 Apr 2014 09:53:20 +0530
Message-ID: <CAOh2x=kSuDxpuBgHGwcRwykPthB1GZ_UVBvxe2s-M-nD7z3ciQ@mail.gmail.com>
References: <5339BF43.4060908@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-pm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type:content-transfer-encoding;
        bh=i344pkdXhuhPOyAJlKKNxzGcBRt8QHp+OZexb6sKyaQ=;
        b=k0gdVRg41+R7Bfst6TYriRgIcMoTeic9I81IVNP3oMZqhr+gO1e//ZkdafMACFoF8e
         kdeA9Xp+bnRBGMpaAawtAsQsC3LnVT6GbfMcmyCqbnV8UUFo4hHlQ9QsIty9BZ2vSbqe
         u87C2U2AgRgLOFdZ4RbUf8aAA+FtQVkFHZkcVhjOyUAC2i04Xi93+4wickraD31LxUVy
         1ZgFosX5hJusq+fFT5ST+B0lfLVBXGrVatiIxohZqK/JS+fgfw1R5gUL8V+Ii9qtk+d0
         LLeUBKW2DHfsgnSzpTImDJtZXF3yT/hzdaU3LYpVALiPfy+g7Of+IJKNVmJAY/mKyCMO
         uwiw==
In-Reply-To: <5339BF43.4060908@gmx.de>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-1?Q?Toralf_F=F6rster?= <toralf.foerster@gmx.de>
Cc: "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, Linux PM list <linux-pm@vger.kernel.org>

On Tue, Apr 1, 2014 at 12:47 AM, Toralf F=F6rster <toralf.foerster@gmx.=
de> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA256
>
> all other files in that directory are 644 , but that file has 400 ?
>
> Kernel is v3.14

https://bugzilla.kernel.org/show_bug.cgi?id=3D65611
