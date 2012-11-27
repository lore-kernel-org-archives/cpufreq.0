From: Sudeep K N <sudeepholla.maillist@gmail.com>
Subject: Re: [PATCH] cpufreq: SPEAr: Add CPUFreq driver
Date: Tue, 27 Nov 2012 11:19:49 +0000
Message-ID: <CAPKp9uZY022gdbRYs-a87xb4nnStOWUDQtS=_nJe0p7KTgvFKA@mail.gmail.com>
References: <7ec0e3f4b81b70f3def4257e6b9781efd4c7a3d2.1353785862.git.viresh.kumar@linaro.org>
	<CAPKp9uZ-HpAp2KO9qKXsMCoGJS3Vn-VW34h6cbv8o01Vzzi4jw@mail.gmail.com>
	<CAKohponbWUTtxMBLTGaRTmQX4WArtHAt9KzAnqF2OtQpf46osg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=f98yQlC/u1XN5IlAuX0YF9W+USMkE82VMIhmFE+Pe34=;
        b=txIndPpJWkJ8fPsUNsmJta1kBiEhvVEGSkdZTOATyBdLj1kreR0+4An1t/g3TvL4K1
         j48xF39iUNKBoFZk1GFlihrCYZe5te/YBGbGwF61+7etEa+CHrwyM0a/8ZFVuBFjrOTY
         RZAJsH9IYN82mzqamfCZD42o5D7w9i4M5GTXDcXHtf8pfEzHoM4xrp1DOy8cyMG5QqEq
         EsyqH4Nxkgvzd66E7zNcKpjToHBIB4dxtVPAsaF9ipS+Ekqk+SlAuT23JWhjE6nPNndg
         RVYd+AQ1mhDUM+uvL4vel6WlGjcdSyfAzwjb6XKPl+hyKdaCcpjKzBYbgB92vnIX2pkL
         OMXg==
In-Reply-To: <CAKohponbWUTtxMBLTGaRTmQX4WArtHAt9KzAnqF2OtQpf46osg@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: rjw@sisk.pl, devicetree-discuss@lists.ozlabs.org, spear-devel@list.st.com, cpufreq@vger.kernel.org, Deepak Sikri <deepak.sikri@st.com>, linux-arm-kernel@lists.infradead.org

On Tue, Nov 27, 2012 at 9:33 AM, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> On 27 November 2012 14:54, Sudeep K N <sudeepholla.maillist@gmail.com> wrote:
>> On Sat, Nov 24, 2012 at 7:39 PM, Viresh Kumar <viresh.kumar@linaro.org> wrote:
>> [...]
>>> diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-spear.txt b/Documentation/devicetree/bindings/cpufreq/cpufreq-spear.txt
>>> new file mode 100644
>>> index 0000000..4cf2819
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-spear.txt
>>> @@ -0,0 +1,29 @@
>>> +SPEAr cpufreq driver
>>> +-------------------
>>> +
>>> +SPEAr SoC cpufreq driver for CPU frequency scaling.
>>> +It supports both uniprocessor (UP) and symmetric multiprocessor (SMP) systems
>>> +which share clock across all CPUs.
>>
>> If this is the case, is there any particular reason why you cannot use
>> the generic
>> cpufreq-cpu0 driver ?
>
> Please go through the discussion already done with Shawn. There is lot of
> SPEAr specific code here.
>

Sorry I missed the fact that there are more patches, I based my commit
on clock related changes in current patch.

-- 
Regards,
Sudeep
