From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH 0/4] CPUFreq: Implement per policy instances of governors
Date: Tue, 5 Feb 2013 14:22:42 +0100
Message-ID: <20130205132241.GH4827@pd.tnic>
References: <20130205091532.GA4827@pd.tnic>
 <CAKohpo=6q+Bcgq0Re=3SXM6zwub5N=vJBO=sTeEgZZ9byFK7=g@mail.gmail.com>
 <20130205102721.GB4827@pd.tnic>
 <CAKohpo=_Qq-_Aqy7nZD+f28-B7DY8ioQ5fe8bYKTe64A0RXeGw@mail.gmail.com>
 <20130205110407.GC4827@pd.tnic>
 <CAKohponiiVO_P2EDDTUHeoo7j3FG-ELtP8oLwfdEQ3HkgOS77g@mail.gmail.com>
 <20130205111918.GD4827@pd.tnic>
 <CAKohpomUsDr0YJmOxjymcAAJnfOxKfzxGL4iHuif1qCAvy0OYA@mail.gmail.com>
 <20130205113242.GF4827@pd.tnic>
 <CAKohpo=ABkc3ku=YrS7=Df_65s3OPg+eAa80gCEkiK4dNc+x4g@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1360070563; bh=LOeg795TZQuLSKJk16Bn/ZVcpDhrclytZb0zTX6/QoA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=iOFDuKCv+T66v/Pfgxe3WzEuV1uNpBnJ6Z2pUg
	3HwxfaMNMyJs1OPwCKeL8NWXvahUyu0Wq5unXQ1MdWMD/LYB2fTUPv9Nh/6yIveRpyK
	A46ASNAqQItxKAi6qwjY1GE54ylQtZIcJACJ8AFTLObDR+J3qSgurCzKslM+/X3stM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1360070563; bh=LOeg795TZQuLSKJk16Bn/ZVcpDhrclytZb0zTX6/QoA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=iOFDuKCv+T66v/Pfgxe3WzEuV1uNpBnJ6Z2pUg
	3HwxfaMNMyJs1OPwCKeL8NWXvahUyu0Wq5unXQ1MdWMD/LYB2fTUPv9Nh/6yIveRpyK
	A46ASNAqQItxKAi6qwjY1GE54ylQtZIcJACJ8AFTLObDR+J3qSgurCzKslM+/X3stM=
Content-Disposition: inline
In-Reply-To: <CAKohpo=ABkc3ku=YrS7=Df_65s3OPg+eAa80gCEkiK4dNc+x4g@mail.gmail.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linaro-dev@lists.linaro.org, robin.randhawa@arm.com, Steve.Bannister@arm.com, Liviu.Dudau@arm.com, Charles Garcia-Tobin <Charles.Garcia-Tobin@arm.com>

On Tue, Feb 05, 2013 at 05:54:57PM +0530, Viresh Kumar wrote:q
> This indication isn't enough. On a single image solution, we need to
> identify the system which needs support for multiple policies and i
> still feel we need that variable type indication :)

If the image is going to run also on systems which support only a
single policy, then I guess you can make it a bool, stuff it in struct
cpufreq_policy and ifdef around it.

-- 
Regards/Gruss,
    Boris.

Sent from a fat crate under my desk. Formatting is fine.
--
