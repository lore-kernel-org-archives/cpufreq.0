From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 58541] [pandaboard] cpu frequency limitation
Date: Mon, 20 May 2013 19:48:17 +0000 (UTC)
Message-ID: <20130520194817.06CCF11FA61@bugzilla.kernel.org>
References: <bug-58541-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-58541-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=58541


Nishanth Menon <nm@ti.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |nm@ti.com




--- Comment #2 from Nishanth Menon <nm@ti.com>  2013-05-20 19:48:16 ---
This is correct - *ONLY* 920MHz will be supported by default without AVS Class
1.5, Adaptive Body Bias(ABB) support enabled. ABB and AVS class 1.5 is
mandatory for frequencies 1.2GHz and 1.5GHz to be enabled.

For PandaBoard ES, we also have additional constraint. MPU voltage is supplied
by TPS62391 PMIC chip which can only be controlled from I2C_SR.

we DONOT have any form of support for pmic control over i2c_sr.

Current status:
a) ABB support - currently blocked due to lack of clock node support in OF.
   i) ABB driver support and DTS conversion:
http://marc.info/?l=linux-omap&m=136751559523901&w=2
   ii) Clock node support preventing this from being merged in:
http://marc.info/?t=136804008400001&r=1&w=2
b) TPS62361 support and hence voltage control over i2c_sr -> to be posted in
linux-omap mailing list this week -
https://github.com/nmenon/linux-2.6-playground/commits/devel/vc-vp-regulator
has the prelim patches undergoing TI internal review.

In short - this was never a feature that k.org had support till date.

For full conversion, see the overview steps I posted here:
https://plus.google.com/u/0/112464029509057661457/posts/gvyZQcNieoq

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
