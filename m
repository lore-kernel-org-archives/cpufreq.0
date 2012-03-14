From: Grazvydas Ignotas <notasas@gmail.com>
Subject: Re: [GIT PULL] cpufreq: OMAP updates for v3.4
Date: Wed, 14 Mar 2012 19:38:38 +0200
Message-ID: <CANOLnON+hHtnjo9samAqvXp_nVJMjQ7CnxMCe7ggO4UwYaz4rw@mail.gmail.com>
References: <87y5rci2na.fsf@ti.com>
	<CANOLnON91vXWb2L-FXjz3sqq-9j5SaEodtpt_yvFiN33D4Q3Ow@mail.gmail.com>
	<87wr6ngkrl.fsf@ti.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-omap-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=honh6HVq7IlpJK8clxq9kQBYmU8NA6BWhUhDPY24YUw=;
        b=tWrbHRENYdsnUGMGTBuApD6Zc1CwXBRVMjexStjkgFeNzITIN5QKdGoudHovEF3s3u
         ayJ6ceRxEfyqnQxHkOIG9/M4gm9fqG4hD82ALtwmqkNqD1XGFCz553npOY0qR9e4Bf3y
         2On5Leia14QpE7Kc2H1XsucaqGJm3cwQ/ENgGch10SO763Dn8ZvVmXm/Zo07jLqEeG6i
         7/nfDzlrq7B6jykQLnNfdG4ftVl5nMyFzuZY2TIrxSBtgFAiSsQ4CH79GVHc+2gjq5Ov
         osZIcftYYOEB4iwvhDfq/D0fXOWpAJZ6d1v6Cp52X1RNnUT/3TERMxEAtoBPPtZNJKhW
         4UVw==
In-Reply-To: <87wr6ngkrl.fsf@ti.com>
Sender: linux-omap-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Kevin Hilman <khilman@ti.com>
Cc: Dave Jones <davej@redhat.com>, cpufreq@vger.kernel.org, linux-omap <linux-omap@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>

On Wed, Mar 14, 2012 at 7:22 PM, Kevin Hilman <khilman@ti.com> wrote:
> Grazvydas Ignotas <notasas@gmail.com> writes:
>
> [...]
>
>>> Russell King (1):
>>> =C2=A0 =C2=A0 =C2=A0cpufreq: OMAP driver depends CPUfreq tables
>>
>> It seems this one got messed up, it says "default ARCH_OMAP2PLUS"
>> instead of depends.
>
> That was intentional. =C2=A0What do you think is messed up about it?
>
> It's the same as saying:
>
> =C2=A0 =C2=A0 depends on ARCH_OMAP2PLUS
> =C2=A0 =C2=A0 default y

Hm, somehow I've never encountered this syntax, but it more looks like
it means "default y if ARCH_OMAP2PLUS" instead of that.

Checked this with menuconfig now:
  default ARCH_OMAP2PLUS
resolves to:
  ARCH_HAS_CPUFREQ [=3Dy] && CPU_FREQ [=3Dy] && ARM [=3Dy]

=2E.which might cause build break when OMAP is not selected, and

  depends on ARCH_OMAP2PLUS
  default y
resolves to:
  ARCH_HAS_CPUFREQ [=3Dy] && CPU_FREQ [=3Dy] && ARM [=3Dy] && ARCH_OMAP=
2PLUS [=3Dy]

=2E.which should be randconfig friendly.

--=20
Gra=C5=BEvydas
--
To unsubscribe from this list: send the line "unsubscribe linux-omap" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
