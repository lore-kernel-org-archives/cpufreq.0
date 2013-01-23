From: Jacob Shin <jacob.shin@amd.com>
Subject: New governor?
Date: Wed, 23 Jan 2013 13:07:12 -0600
Message-ID: <20130123190711.GA8394@jshin-Toonie>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@sisk.pl>, cpufreq@vger.kernel.org

Rafael, cpufreq list,

I was wondering ..

- Is hardware architecture specific governor acceptable in upstream?
  i.e. drivers/cpufreq/cpufreq_amd_governor.c

If not ..

- Is it acceptable to patch ondemand and/or conservative governors to
  call into some hardware achitecture specific function that affects
  the governors's freqency change decisions? (of course it would only
  be avaiable on certain hardware and only kicks in if user wants it
  to)

Basically, we have some AMD specific processor registers that tell us
information that could help in making frequency change decisions for
better power savings, and I was wondering what the proper way to go
about implementing something like this would be.

Thanks!

-Jacob

