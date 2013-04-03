From: Tony Luck <tony.luck@gmail.com>
Subject: Re: [PATCH 4/9] ia64: cpufreq: move cpufreq driver to drivers/cpufreq
Date: Wed, 3 Apr 2013 10:35:06 -0700
Message-ID: <CA+8MBb+S+NF1Dq98CVmO54F+bT_MS2ni3KLRo5S13J1KGuFkeg@mail.gmail.com>
References: <cover.1364229828.git.viresh.kumar@linaro.org>
	<afc636963b63becccf34d092203c53369bd1b735.1364229828.git.viresh.kumar@linaro.org>
	<CAKohponax2iDZeA-WG_L2XVHU5GGJB2nSPWVoVxbZUoez1ZpDw@mail.gmail.com>
	<CAKohpokkyQK+650aPLtdXJ0wHWupR=-bcTM_eCoZRDy3N47HJQ@mail.gmail.com>
	<CA+8MBbLwxiPPvyKyQNEDSbNKthpAmooKVe7b+pg-NCETOkSLPA@mail.gmail.com>
	<CAKohpompxOpwi7fsy1m5UBxymR=dsVra3wvMcvziu7jd9iq8Ow@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:in-reply-to:references:date:message-id
         :subject:from:to:cc:content-type;
        bh=L2oIXpMjmRvX3hMAR2L+ywofdt+BJ5VuoWOawDgjULc=;
        b=q5RiRXK0+pKMcrHdIxhUuytaMge4kRVLPEQXaUTsZ3M7cypxaqYPUfoSDuOl+oKvnz
         LIg3gzPz75ugiHpCKrOVCuYtkMBi9xOn635cBKFAEOBY8OTKCb3Pgx7ayh4WNZdhd3uz
         JpqX+KqcDbs7gY8OPlYqhxlPMZrvwi9qKbxHHItKOPJPwEZLf7N0EkL+MxtxdjFjtGz8
         4pVR1WUp6BYiztG2PTXhURU8OH20pczxgerR26vmeQxevzxUGIhSb9Lc5jGhXzVHsiAe
         AbbRleb4I6+n8ds0eYVkI46GZOZjZ+KyEY0OyLNsOfehGnupGF1WPqqj0e8uQql00UCa
         qDEQ==
In-Reply-To: <CAKohpompxOpwi7fsy1m5UBxymR=dsVra3wvMcvziu7jd9iq8Ow@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Fenghua Yu <fenghua.yu@intel.com>, "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, arvind.chauhan@arm.com, Robin Randhawa <robin.randhawa@arm.com>, Steve.Bannister@arm.com, Liviu.Dudau@arm.com, Charles Garcia-Tobin <charles.garcia-tobin@arm.com>, cpufreq@vger.kernel.org, Linux PM mailing list <linux-pm@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linaro-kernel@lists.linaro.org, Arnd Bergmann <arnd.bergmann@linaro.org>, "Rafael J. Wysocki" <rjw@sisk.pl>

On Mon, Apr 1, 2013 at 5:49 PM, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> For now, your Ack will work :)

Acked-by: Tony Luck <tony.luck@intel.com>
