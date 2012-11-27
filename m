From: Sudeep K N <sudeepholla.maillist@gmail.com>
Subject: Re: [PATCH] cpufreq: SPEAr: Add CPUFreq driver
Date: Tue, 27 Nov 2012 09:24:55 +0000
Message-ID: <CAPKp9uZ-HpAp2KO9qKXsMCoGJS3Vn-VW34h6cbv8o01Vzzi4jw@mail.gmail.com>
References: <7ec0e3f4b81b70f3def4257e6b9781efd4c7a3d2.1353785862.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=OeALFgDWQQaU637EGK7FImQ1EQHnUqkBENmAGuCq48k=;
        b=aM1JA31qBLr2NQeaAHL/8TrxG5kPpyhV2Ek/un6pLd6UlO6qOAHvvwYIxOJFXgTX74
         Wqpr7jauGNBMh01cGqJrduCqJORZPdhhag6YhG78NBXRCwTrTCafw0hg5VR0A2QT724m
         ShtM4SKMhE13FMMvraHGcW3oDjTF7KPsW2KMBEz+JWdBWdpJI3BuyY2L1i/d6m8VbzpZ
         3ub8JfWLE4mUrkeLg5eN/9DfQbPHlDadHgQjfQ5Iv2JZ3mLW8xNSDx83orpRGbXx86U6
         zjRYz6/JiMyZ79Iac8iz5l31Y1DY/z2sw+hPBRcWzPJAzACr8HBfsVaLDhJfju0v55mJ
         J3Ig==
In-Reply-To: <7ec0e3f4b81b70f3def4257e6b9781efd4c7a3d2.1353785862.git.viresh.kumar@linaro.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: rjw@sisk.pl, devicetree-discuss@lists.ozlabs.org, spear-devel@list.st.com, cpufreq@vger.kernel.org, Deepak Sikri <deepak.sikri@st.com>, linux-arm-kernel@lists.infradead.org

On Sat, Nov 24, 2012 at 7:39 PM, Viresh Kumar <viresh.kumar@linaro.org> wrote:
[...]
> diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-spear.txt b/Documentation/devicetree/bindings/cpufreq/cpufreq-spear.txt
> new file mode 100644
> index 0000000..4cf2819
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-spear.txt
> @@ -0,0 +1,29 @@
> +SPEAr cpufreq driver
> +-------------------
> +
> +SPEAr SoC cpufreq driver for CPU frequency scaling.
> +It supports both uniprocessor (UP) and symmetric multiprocessor (SMP) systems
> +which share clock across all CPUs.

If this is the case, is there any particular reason why you cannot use
the generic
cpufreq-cpu0 driver ?

Regards,
Sudeep
