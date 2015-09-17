From: Deirdre Kylie <kylie.deirdre@gmail.com>
Subject: cpufreq doesn't work quite on Dell GX520 with Pentium D at 2.80gHz
Date: Thu, 17 Sep 2015 12:24:19 -0700
Message-ID: <CACs6S=huh52Q6N4t=1bOzfz+ZRMk5p1jy-STHDDr8K32KRVGcQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=s6i2DQ92rvjdV3IyzgVhBCd4YWKTcH8cgpSx1DB1NCk=;
        b=LdnMs72fhGAxHF7J8PJLHjh0UJu0sQx74ZMVZgu49FhFDeFca/EKObZPDLyTZZwt7D
         rDzmyAhMBtjbIG0l5JrAj6KrX+5WvD7pSltBD1n1RaFVOrIHgvtzQfyninPbnvtK2I0O
         uoH7JsAGwMo/8FApVagNsBzMHp8CUNOvhKhI+ndTLGF17TTU27NemACnLHQHNUsFc2wD
         EVIvDkjHh4YJfRt0JraHuT01t4Q2PRFSfxybM/8cOgO3GTJ8pL+ETGseTxyf4TNCQqtG
         twr06z0dKns5W3APDWJTpcZDrDzmCAPvB+12B+HmjlBZTM/bhfj4DVPNOO/5ulOBSO1A
         rZBg==
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

Here is the results after "apt-get"-ing it and running cpufreq-info
~~~~~~~~~~~~~~~~~~~~~~~~~~~
...
Preparing to unpack .../cpufrequtils_008-1_amd64.deb ...
Unpacking cpufrequtils (008-1) ...
Processing triggers for man-db (2.6.7.1-1ubuntu1) ...
Processing triggers for ureadahead (0.100.0-16) ...
ureadahead will be reprofiled on next reboot
Setting up libcpufreq0 (008-1) ...
Setting up cpufrequtils (008-1) ...
 * Loading cpufreq kernel modules...                                     [fail]
 * CPUFreq Utilities: Setting ondemand CPUFreq governor...
          * disabled, governor not available...
           [ OK ]
Processing triggers for libc-bin (2.19-0ubuntu6.6) ...
Processing triggers for ureadahead (0.100.0-16) ...
root@deeDell:/home/dee# cpufreq-info
cpufrequtils 008: cpufreq-info (C) Dominik Brodowski 2004-2009
Report errors and bugs to cpufreq@vger.kernel.org, please.
analyzing CPU 0:
  no or unknown cpufreq driver is active on this CPU
  maximum transition latency: 4294.55 ms.
analyzing CPU 1:
  no or unknown cpufreq driver is active on this CPU
  maximum transition latency: 4294.55 ms.
~~~~~~~~~~~~~~~~~~~~~

and here is using cpufreq-set (which I knew wouldn't run but I did it
to get any info I could for you.
~~~~~~~~~~~~~~~~~~~~
root@deeDell:/home/dee# cpufreq-set -c 0 -g performance
Error setting new values. Common errors:
- Do you have proper administration rights? (super-user?)
- Is the governor you requested available and modprobed?
- Trying to set an invalid policy?
- Trying to set a specific frequency, but userspace governor is not available,
   for example because of hardware which cannot be set to a specific frequency
   or because the userspace governor isn't loaded?
~~~~~~~~~~~~~~~~~~~~~~~~~

I hope this is helpful for you

Thank you!
