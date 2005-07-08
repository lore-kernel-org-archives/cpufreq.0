From: Nikolay Pelov <Nikolay.Pelov@cs.kuleuven.ac.be>
Subject: Re: speedstep-centrino on dothan
Date: Fri, 8 Jul 2005 12:59:18 +0200 (MEST)
Message-ID: <Pine.GSO.4.10.10507081247090.7617-100000@bollie.cs.kuleuven.ac.be>
References: <20050707235928.71016f61@horst.morte.male>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel=40m.gmane.org-S262453AbVGHLAc@vger.kernel.org>
In-Reply-To: <20050707235928.71016f61@horst.morte.male>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: st3@riseup.net
Cc: Bill Davidsen <davidsen@tmr.com>, linux-kernel@vger.kernel.org, cpufreq@lists.linux.org.uk

On Thu, 7 Jul 2005 st3@riseup.net wrote:

> 
> int main() {
> unsigned int index, frequency, voltage
> 
> index = (((frequency)/100) << 8) | ((voltage - 700) / 16);
> printf ("%u\n", index);
> }
> 
> frequency is expressed in MHz, voltage in mV, index is the value for
> centrino_model[cpu]->op_points[y].index 

Few days ago I discussed on the cpufreq mailing list that the above formula
is not the correct way to compute the index. Instead of frequency, one
should use a multiplier, i.e.:

  index = (multiplier << 8) | ((voltage - 700) / 16);

and the multiplier is computed as multiplier = frequency/fsb_speed.
On older systems fsb_speed = 100 MHz and that's why the original formula
was working. But for the Sonoma (Centrino 2) Pentium M processors
fsb_speed = 133 MHz. 

To give an example, take a CPU speed of 800MHz and a front side bus of
133MHz. Using the original formula we will use the value

  frequency/100 = 800/100 = 8

which is wrong. The correct value is:

  multiplier = frequency/fsb_speed = 800/133 = 6.

Nikolay
