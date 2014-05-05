From: Nishanth Menon <nm@ti.com>
Subject: Re: [PATCH 1/2] PM / OPP: Remove cpufreq wrapper dependency on
 internal data organization
Date: Mon, 5 May 2014 09:25:58 -0500
Message-ID: <CAGo_u6pcEKDiAqvJW66_p7M7D0noFj6o9Rw5_d8Af3NMBhHA=g@mail.gmail.com>
References: <1399296830-13056-1-git-send-email-nm@ti.com>
	<1399296830-13056-2-git-send-email-nm@ti.com>
	<CAKohpomeP3Ftx8mH=x0Hj7HEpw6A9X8O8JEFqvrJbkZYDqDS6Q@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type;
        bh=pBCwoFaGIAL71CLl0ZTj4O6xbof2jotXtrMl23/m6NI=;
        b=gXA6AM0XZNumGjg2g+R0kVX+GPJqW2oDapxXNhyR4pxqii68aDEGVbBwqANlOLswLf
         jBnhlkV5NLo1tpKBk3YWt/kd7rtrXEMk1AkgIh3LiWvIUNHNve7P1eIzhFfuo04DK12A
         ZRyfbZ0EztQGA9kmmODgbJ/lvnvzgyLn1Z9L/3onzwycmt1mZ9MKVYA7FiZ+ku30z4Xk
         QmTdKFNe3b+taU6ZLp7TifGVxPwv/uKzUOk/Rd7iAcgWmzCqTgePsQOaV5irO3A/N9sy
         4o7BmKqeTz4tjiN0Dv5B5+M412sqwxUyW99Po1c+hw1MCKlruSrXfCzyYo1ZqOwVz2Dm
         VFWg==
In-Reply-To: <CAKohpomeP3Ftx8mH=x0Hj7HEpw6A9X8O8JEFqvrJbkZYDqDS6Q@mail.gmail.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Kevin Hilman <khilman@deeprootsystems.com>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-omap <linux-omap@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Mon, May 5, 2014 at 9:23 AM, Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
>
> What if opp is being added for some reason at the same time?
> I hope we can surely see some awkward results, maybe some
> NULL pointers invocations as well..

we wont - rcu operations ensure that.
