From: Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH 1/3] workqueue: define mod_scheduled_delayed_work[_on]()
 helpers
Date: Wed, 27 Feb 2013 07:29:49 -0800
Message-ID: <20130227152949.GD22383@htj.dyndns.org>
References: <5249868a014d716eb38cc90e04ed0f6051e65fc3.1361964515.git.viresh.kumar@linaro.org>
 <20130227151036.GC22383@htj.dyndns.org>
 <CAKohponvsL7BsabqkLS6W4EHx1N7=Ua04JwZksztPqwzW2ze=w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:sender:date:from:to:cc:subject:message-id:references
         :mime-version:content-type:content-disposition:in-reply-to
         :user-agent;
        bh=bp+Gy0T0JdONqMno+zVi2v9BaShDiDWcktz/v2gwC/g=;
        b=BV14LF4APLOE+hbqM81Nk4n9ItD/1qQ2UlZuUXQZv9WNye42G8vR6LMuvw583l/t6a
         hDUTEPVdLZy+aIfml+jSvjbK8gna8cbMLV7Vm6abP5vvun3qCa71OrlIleicDgyfqMHe
         M+UGe5ceYC+oONVOHsiIldb2nMhqg7njHflKxv33Z2QSA8VepmWKovcWgsSG5sGpd2p4
         4wGRtP+rn3GArZsxHEilB2OcFKD+04TcT1olBKbru37zjbiqWFFf1lvSXymlx4lsXCB0
         53cCcOaPUs4JcLxKOgnplTTrgNFZoNsm8p5uB8LhYiJKHhjA4bqdA/ouYK7ojX5+P9SU
         dWow==
Content-Disposition: inline
In-Reply-To: <CAKohponvsL7BsabqkLS6W4EHx1N7=Ua04JwZksztPqwzW2ze=w@mail.gmail.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: rjw@sisk.pl, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linaro-kernel@lists.linaro.org, robin.randhawa@arm.com, Steve.Bannister@arm.com, Liviu.Dudau@arm.com, charles.garcia-tobin@arm.com, rickard.andersson@stericsson.com, fabio.baltieri@linaro.org

Hello, Viresh.

On Wed, Feb 27, 2013 at 08:44:52PM +0530, Viresh Kumar wrote:
> To keep things aligned probably i should replace schedule_work() with
> queue_work() and use system_wq there too..

Yeah, that probably is more preferable.  There are codes like the
following in kernel and they always irk me.

	if (custom_wq)
		queue_work();
	else
		schedule_work();

It's just silly.

Thanks.

-- 
tejun
