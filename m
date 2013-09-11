From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 60839] scaling_max_freq cannot be set to values larger than
 bios_limit
Date: Wed, 11 Sep 2013 19:49:59 +0000
Message-ID: <bug-60839-12968-hmGdm1A9oY@https.bugzilla.kernel.org/>
References: <bug-60839-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-60839-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D60839

--- Comment #6 from Sven K=C3=B6hler <sven.koehler@gmail.com> ---
Nope, the patch didn't help. Here's the bash-code I used to test:

cmax=3D$(cat cpuinfo_max_freq)
echo $cmax >scaling_max_freq
bmax=3D$cmax
while [ $bmax -ge $cmax ]; do
  bmax=3D$(cat bios_limit)
  smax=3D$(cat scaling_max_freq)
  echo $cmax >scaling_max_freq
  echo $bmax $smax
done
while true; do
  echo $(cat bios_limit) $(cat scaling_max_freq)
  sleep 0.5
done

The output is like this:

2534000 2534000
2534000 2534000
2534000 2534000
2534000 2534000
2534000 1199000
1199000 1199000
1199000 1199000
1199000 1199000
1199000 1199000
1199000 1199000
1199000 1199000
1199000 1199000
1199000 1199000
1199000 1199000
1199000 1199000
1199000 1199000
1199000 1199000
1199000 1199000
1333000 1199000
1333000 1199000
1333000 1199000
1333000 1199000
1466000 1199000
1466000 1199000


As you can see, scaling_max_freq remains low. When the script is not ru=
nning,
scaling_max_freq increases along with bios_limit.

--=20
You are receiving this mail because:
You are the assignee for the bug.