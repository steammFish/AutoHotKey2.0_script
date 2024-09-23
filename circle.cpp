#include <iostream>
#include <vector>
#include <cmath>

using namespace std;

struct Point {
    int x, y;

    // Constructor taking x and y coordinates
    Point(int x, int y) : x(x), y(y) {}
};
vector<Point> generate_polygon_points(int radius, int sides) {
    vector<Point> points;
    double angle_increment = 2 * M_PI / sides;
    double scale_factor = 1000;  // 缩放因子，可根据精度需求调整

    for (int i = 0; i < sides; ++i) {
        double angle = i * angle_increment;
        int x = int(radius * cos(angle) * scale_factor + 0.5) / scale_factor;
        int y = int(radius * sin(angle) * scale_factor + 0.5) / scale_factor;
        points.emplace_back(x, y);
    }

    return points;
}

int main() {
    int sides{32}, radius{100};
    int delay{10};

    vector<Point> points = generate_polygon_points(radius, sides);
    
    cout << "[" << endl;
    for (int i = 0; i < sides; i++)
        cout << "\t{ x: " << points[i].x << ", y: " << points[i].y << ", delay: " << delay << " }" 
            << ((i == sides-1) ? "" : ",") << endl;
    cout << "]" << endl;

    return 0;
}